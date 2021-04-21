import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { SubscriptionLike } from 'rxjs';
import { ObservableDataService } from '../observable/behaviourSubject.service';
import { ListingService } from './listing.service'
@Component({
  selector: 'app-listing-page',
  templateUrl: './listing-page.component.html',
  styleUrls: ['./listing-page.component.css']
})
export class ListingPageComponent implements OnInit, OnDestroy  {

  apartment;
  house;
  studentAccommodation;
  shareAccommodation;
  responseBody;
  filterPrice;
  isApartmentDisabled : boolean = false;
  isHouseDisabled : boolean = false;
  isStudentAccomodationDisabled : boolean = false;
  isShareAccomodationDisabled : boolean = false;
  observ: SubscriptionLike;
  constructor(private _router : Router, private listingService : ListingService, private _observableDataService : ObservableDataService) { }

  ngOnInit(): void {
    localStorage.clear();

    this.observ = this._observableDataService.detailPageData.subscribe((requestData)=>{
      if(requestData != null){
        this.listingService.listBySection(requestData.param).subscribe((responseData)=>{
          this.responseBody = responseData;
        })
      } else {
        this.onLoadBinding();
      }
    })
  }

  ngOnDestroy() {
    this.observ.unsubscribe()
    this.responseBody = []
}

  onLoadBinding(){
    this.listingService.listingProperty().subscribe((responseData)=>{
        this.responseBody = responseData;
    })
  }

  detailPage(id,param){
    let obj = {
      "id" : id,
      "param" : param
    }
    this._observableDataService.passDetailData(obj);
    this._router.navigate(['detail-page']);
  }

  reset(){
    this.isApartmentDisabled = false;
    this.apartment = false;
    this.isHouseDisabled = false;
    this.house = false;
    this.isStudentAccomodationDisabled = false;
    this.studentAccommodation = false;
    this.isShareAccomodationDisabled = false;
    this.shareAccommodation = false;
    this.onLoadBinding();
  }

  filterByPrice(e){
    let url = localStorage.getItem('endUrl');
    if(e.value == 0 && url != null){
      this.listingService.listByPriceFilterURLAsc(url).subscribe((responseData)=>{
        this.responseBody = responseData
      })
    } else if(e.value == 1 && url != null) {
      this.listingService.listByPriceFilterURLDesc(url).subscribe((responseData)=>{
        this.responseBody = responseData
      })
    } else if(e.value == 0) {
      this.listingService.listByPriceFilterAsc('/mostViewedProperty').subscribe((responseData)=>{
        this.responseBody = responseData
      })
    } else {
      this.listingService.listByPriceFilterDesc('/mostViewedProperty').subscribe((responseData)=>{
        this.responseBody = responseData
      })
    }
  }

  sort(reqParam){
    this.apartment ? this.isApartmentDisabled = true : !this.isApartmentDisabled;
    this.house ? this.isHouseDisabled = true : !this.isHouseDisabled;
    this.studentAccommodation ? this.isStudentAccomodationDisabled = true : !this.isStudentAccomodationDisabled;
    this.shareAccommodation ? this.isShareAccomodationDisabled = true : !this.isShareAccomodationDisabled;
    localStorage.setItem('endUrl',reqParam)
      if(reqParam.length > 0){
        this.listingService.listByFilter(reqParam).subscribe((responseData)=>{
              if(responseData.length > 0){
                this.responseBody = responseData
              } else {
                this.responseBody = []
                this.onLoadBinding()
              }
          })
      } else {
        this.responseBody = []
        this.onLoadBinding()
      }
       }
}
