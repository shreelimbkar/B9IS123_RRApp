import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ObservableDataService } from './observable/behaviourSubject.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'GoSolo';
  isLoggedIn$: Observable<boolean>;
  loginFlag: boolean;
  constructor(private _route: Router,private _observableDataService : ObservableDataService ){

  }
  // ngOnInit method Initiate first every time
  ngOnInit(): void {
    let checkUser = localStorage.getItem("user")
    if(checkUser) {
      // location.reload()
      this.loginFlag = true;
    } else {
      this.loginFlag = false;
    }
  }

  // homepage method navigate to home page
  homepage(){
    this._route.navigate([''])
  }

  // BuyMenu method navigate to listing page

  BuyMenu(param){
    let obj = {
      "param" : param
    }
    this._observableDataService.passDetailData(obj);
    this._route.navigate(['listing'])
  }

  // RentMenu method navigate to listing page

  RentMenu(param){
    let obj = {
      "param" : param
    }
    this._observableDataService.passDetailData(obj);
    this._route.navigate(['listing'])
  }

  login(){
    this._route.navigate(['login'])
  }

  logOut(){
    localStorage.clear()
    location.reload()
    alert("Logged Out Successfully!")
    this._route.navigate([''])
  }

  // menu Explore Solo catergory navigation
  browserSection(param){

    let obj = {
      "param" : param
    }
    this._observableDataService.passDetailData(obj);
    this._route.navigate(['listing'])
  }


}

