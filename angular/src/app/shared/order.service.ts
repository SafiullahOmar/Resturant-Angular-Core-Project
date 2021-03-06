import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { OrderItem } from './order-item.model';
import { Order } from './order.model';

@Injectable({
  providedIn: 'root'
})
export class OrderService {
  formData!: Order;
  orderItems: OrderItem[] = [];

  constructor(private http: HttpClient) { }

  SaveOrder() {
    var body={
      ...this.formData,
      OrderItems: this.orderItems
    };
    return this.http.post(environment.APIURL + '/order',body);
  }

  GetOrderList(){
    return this.http.get(environment.APIURL+'/order');
  }

  GetOrderListById(id:number):any{
    return this.http.get(environment.APIURL+'/order/'+id);
  }
}
