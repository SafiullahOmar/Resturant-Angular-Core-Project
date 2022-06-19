import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { UserService } from 'src/app/shared/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styles: [
  ]
})
export class LoginComponent implements OnInit {

  constructor(private service: UserService, private router: Router, private toaster: ToastrService) { }

  formModel = {
    UserName: '',
    Password: ''
  }

  ngOnInit(): void {
  }
  OnSubmit(form: NgForm) {
    this.service.login(form.value).subscribe(
      (res: any) => {
        localStorage.setItem('token', res.token);
        this.router.navigateByUrl('/home');
      },
      err => {
        if (err.status == 400)
          this.toaster.error('Incorrect user or Password', 'Authentication Failed');
        else
          console.log(err);
      });

  }
}
