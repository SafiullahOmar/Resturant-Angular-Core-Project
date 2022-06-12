import { Component, Inject, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Item } from 'src/app/shared/item.model';
import { ItemService } from 'src/app/shared/item.service';
import { OrderService } from 'src/app/shared/order.service';
import { OrderItem } from 'src/app/shared/order-item.model';

@Component({
  selector: 'app-order-items',
  templateUrl: './order-items.component.html',
  styleUrls: ['./order-items.component.css']
})
export class OrderItemsComponent implements OnInit {

  foodItem!: OrderItem;
  ItemList!: Item[];
  constructor(
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<OrderItemsComponent>
    , private itemService: ItemService,
    private orderService: OrderService) { }

  ngOnInit(): void {

    this.itemService.getItemList().subscribe(data => this.ItemList = data as Item[]);
    console.log(this.data);
    if (this.data.ItemIndex == null) {
      this.foodItem = {
        OrderItemId: 0,
        OrderId!: this.data.OrderId,
        ItemId!: 0,
        Quantity!: 0,
        ItemName!: '',
        Price: 0,
        Total: 0
      };
    } else {
      this.foodItem = Object.assign({}, this.orderService.orderItems[this.data.ItemIndex]);
    }
  }
  updatePrice(ctr: any) {
    if (ctr.selectedIndex == 0) {
      this.foodItem.Price = 0;
      this.foodItem.ItemName = '';
    }
    else {
      this.foodItem.Price = this.ItemList[ctr.selectedIndex - 1].price;
      this.foodItem.ItemName = this.ItemList[ctr.selectedIndex - 1].name;
    }

    this.updateTotal();
  }

  updateTotal() {
    this.foodItem.Total = parseFloat((this.foodItem.Quantity * this.foodItem.Price).toFixed(2));
  }
  submit(form: NgForm) {
    if (this.data.ItemIndex == null)
      this.orderService.orderItems.push(form.value);
    else
      this.orderService.orderItems[this.data.ItemIndex] = form.value;
    this.dialogRef.close();
  }
 
}
