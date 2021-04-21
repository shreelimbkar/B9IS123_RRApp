import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { SubscriptionLike } from 'rxjs';
import { ObservableDataService } from '../observable/behaviourSubject.service';
import { ListingService } from './listing.service'
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';

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
  filterValidateForm;
  location = [
    {name:'Dublin',value:'c-001'},
    {name:'Cork',value:'c-002'},
    {name:'Galway',value:'c-003'},
    {name:'Limerick',value:'c-004'},
    {name:'Waterford',value:'c-005'}
  ]

  constructor(private _router : Router, public formBuilder: FormBuilder, private listingService : ListingService, private _observableDataService : ObservableDataService) { }

  ngOnInit(): void {
      this.filterValidateForm = this.formBuilder.group({
        price : ['', [Validators.required, Validators.email]],
        hotel : ['', [Validators.required]],
        BnB : ['', [Validators.required]],
        bar : ['', [Validators.required]],
        club : ['', [Validators.required]],
        Restaurant : ['', [Validators.required]],
        location : ['', [Validators.required]],
        fiveStar : ['', [Validators.required]],
        fourStar : ['', [Validators.required]],
        threeStar : ['', [Validators.required]],
        twoStar : ['', [Validators.required]]
      })

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

  submitForm(value){
    console.log("++++++++++++++ value ",value)
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
  }

  filterByPrice(e){

  }

  sort(reqParam){

  }

}
