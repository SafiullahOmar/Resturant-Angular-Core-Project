import { Component, OnInit } from '@angular/core';
import { OrderService } from 'src/app/shared/order.service';
import { FormsModule, NgForm } from '@angular/forms';
import { OrderItem } from 'src/app/shared/order-item.model';
import { MatDialog ,MatDialogConfig} from '@angular/material/dialog';
import { OrderItemsComponent } from '../order-items/order-items.component';
import { CustomerService } from 'src/app/shared/customer.service';
import { Customer } from 'src/app/shared/customer.model';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.css']
})
export class OrderComponent implements OnInit {

  //orderItems!: OrderItem[];
  customerList!:Customer[];
  constructor(public Oservice: OrderService, public dialog: MatDialog,
    private custService:CustomerService,
    private toast:ToastrService,
    private router:Router,
    private currentRoute:ActivatedRoute
    ) {

  }

  ngOnInit(): void {
    let orderID=this.currentRoute.snapshot.paramMap.get('id');
    if(orderID==null)
    this.resetform();
    else
this.Oservice.GetOrderListById(parseInt(orderID)).subscribe((res:any)=>{
  this.Oservice.formData=res.order;
  this.Oservice.orderItems=res.orderDetails;
});

    this.custService.getCustomerList().subscribe(rs=>{
      this.customerList=rs as Customer[];
    });

  }

  resetform(form?: NgForm) {
    if (form != null)
      form.resetForm();
    this.Oservice.formData = {
      orderId: 0,
      orderNo: Math.floor(100000 + Math.random() * 900000).toString(),
      customerId: 0,
      pmethod: '',
      gtotal: 0
    };
    this.Oservice.orderItems = [];
  }

  AddOrEditOrderItem(ItemIndex: any, OrderId: any) {
    const config=new MatDialogConfig();
    config.autoFocus=true;
    config.disableClose=true;
    config.width="50%";
    config.data={ ItemIndex,OrderId};
    this.dialog.open(OrderItemsComponent,config).afterClosed().subscribe(res=>{
      this.updadteGrandTotal();
    });
  }

  onDeleteOrderItem(OrderItemId:number,i:number){
    this.Oservice.orderItems.splice(i,1);
    this.updadteGrandTotal();
  }

  updadteGrandTotal(){
    this.Oservice.formData.gtotal=this.Oservice.orderItems.reduce((prev,current)=>{
      return prev+current.total;
    },0);

    this.Oservice.formData.gtotal=parseFloat(this.Oservice.formData.gtotal.toFixed(2));
  }

  onSubmit(form:NgForm){
  this.Oservice.SaveOrder().subscribe(res=>{
    this.resetform();
    this.toast.success("Successfully Added the Records" , "Saveing Alert !");
    this.router.navigate(['/orders']);
  });    
  }

}
