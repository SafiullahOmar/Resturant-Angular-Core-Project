import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Order } from '../shared/order.model';
import { OrderService } from '../shared/order.service';

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.css']
})
export class OrdersComponent implements OnInit {

  constructor(private order: OrderService ,private router:Router) { }
  orderList!: any[];
  ngOnInit(): void {
    this.order.GetOrderList().subscribe(res => {
      this.orderList = res as any[];
    });
  }

  open4Edit(orderId:number){
    this.router.navigate(['/order/edit/'+orderId]);
  }
}
