// import { Injectable } from '@angular/core';
// import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot } from '@angular/router';
// import { BehaviorSubject } from 'rxjs';


// @Injectable()
// export class AuthGuard implements CanActivate {

//   private loggedIn: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);
//   get isLoggedIn() {
//     return  this.loggedIn.asObservable();
//   }
//   constructor( private route: Router) {}

//   canActivate(next: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
//     let userValue = localStorage.getItem("user");
//     console.log("Can Activate servcie  ++++++++++++++ ",userValue)

//     if (userValue != null) {
//       this.loggedIn.next(true);
//        return true;
//     } else {
//       this.loggedIn.next(false);
//       // this.route.navigate([''])
//        return true;
//     }
//   }
// }
