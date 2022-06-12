import { Component, OnInit } from '@angular/core';
import { OrderService } from 'src/app/shared/order.service';
import { FormsModule, NgForm } from '@angular/forms';
import { OrderItem } from 'src/app/shared/order-item.model';
import { MatDialog ,MatDialogConfig} from '@angular/material/dialog';
import { OrderItemsComponent } from '../order-items/order-items.component';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.css']
})
export class OrderComponent implements OnInit {

  //orderItems!: OrderItem[];
  constructor(public Oservice: OrderService, public dialog: MatDialog) {

  }

  ngOnInit(): void {
    this.resetform();

  }

  resetform(form?: NgForm) {
    if (form != null)
      form.resetForm();
    this.Oservice.formData = {
      OrderId: 0,
      OrderNo: Math.floor(100000 + Math.random() * 900000).toString(),
      CustomerId: 0,
      Pmethod: '',
      Gtotal: 0
    };
    this.Oservice.orderItems = [];
  }

  AddOrEditOrderItem(ItemIndex: any, OrderId: any) {
    const config=new MatDialogConfig();
    config.autoFocus=true;
    config.disableClose=true;
    config.width="50%";
    config.data={ ItemIndex,OrderId};
    this.dialog.open(OrderItemsComponent,config);
  }

  onDeleteOrderItem(OrderItemId:number,i:number){
    this.Oservice.orderItems.splice(i,1);
  }

}
