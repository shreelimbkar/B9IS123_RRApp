import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ObservableDataService } from './observable/behaviourSubject.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'propertyAauction';

  constructor(private _route: Router,private _observableDataService : ObservableDataService ){

  }
  // ngOnInit method Initiate first every time
  ngOnInit(): void {
      this._route.navigate([''])
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

  // menu Explore Solo catergory navigation
  browserSection(param){

    let obj = {
      "param" : param
    }
    this._observableDataService.passDetailData(obj);
    this._route.navigate(['listing'])
  }


}

