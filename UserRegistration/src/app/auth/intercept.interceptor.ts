import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable, tap } from 'rxjs';
import { Router } from '@angular/router';

@Injectable()
export class InterceptInterceptor implements HttpInterceptor {

  constructor(private route: Router) { }

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    if (localStorage.getItem('token') != null) {
      const cloneReq = request.clone({
        headers: request.headers.set('Authorization', 'Beaerer ' + localStorage.getItem('token'))
      });

      return next.handle(request).pipe(
        tap(
          succ => { },
          err => {
            if (err.state == 401) {
              this.route.navigate(['/user/login']);
            }
          }
        )
      );
    }
    else {

      localStorage.removeItem('token');
      return next.handle(request.clone());
    }
  }
}
