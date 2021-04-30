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
  categorys = [
    {name:'Hotel',value:'hotel',isChecked:false},
    {name:'BnB',value:'BnB',isChecked:false},
    {name:'Bar',value:'bar',isChecked:false},
    {name:'club',value:'club',isChecked:false},
    {name:'Restaurant',value:'Restaurant',isChecked:false}
  ]
  ratings = [
    {name:'5 Star',value:'5',isChecked:false},
    {name:'4 Star',value:'4',isChecked:false},
    {name:'3 Star',value:'3',isChecked:false},
    {name:'2 Star',value:'2',isChecked:false},
    {name:'1 Star',value:'1',isChecked:false},
  ]
  selectedCategorysList = [];
  selectedRatingList = [];

  constructor(private _router : Router, public formBuilder: FormBuilder, private listingService : ListingService, private _observableDataService : ObservableDataService) { }

  ngOnInit(): void {
      this.filterValidateForm = this.formBuilder.group({
        price : ['', [Validators.required]],
        hotel : ['', [Validators.required]],
        categorys : ['', [Validators.required]],
        ratings : ['', [Validators.required]],
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
        if(requestData.param == 'allbnbs'){
          this.listingService.listBySectionBNB(requestData.param).subscribe((responseData)=>{
            this.responseBody = responseData.body;
          })
        }else {
          this.listingService.listBySection(requestData.param).subscribe((responseData)=>{
            this.responseBody = responseData.body;
          })
        }
      } else {
        this.onLoadBinding();
      }
    })
  }

  changeSelection() {
    this.fetchSelectedItems()
  }
  selectRating(){
    this.fetchRatingSelection()
  }

  fetchSelectedItems() {
    this.selectedCategorysList = this.categorys.filter((element, index) => {
      if(element.isChecked){
        return element.value
      }
    });
  }

  fetchRatingSelection() {
    this.selectedRatingList = this.ratings.filter((element, index) => {
      if(element.isChecked){
        return element.value
      }
    });

  }


  submitForm(value){
   let category =  this.selectedCategorysList.map((element)=>{
      return element.value
    })
    let ratings = this.selectedRatingList.map((element)=>{
      return element.value
    })

   let obj = {
    resource_price: value.price,
    resource_category: category,
    resource_city_code: value.location,
    resource_rating: ratings
    }

    this.listingService.filter(obj).subscribe((responseData)=>{
        this.responseBody = responseData.body;
    })
  }

  ngOnDestroy() {
    // this.observ.unsubscribe()
    // this.responseBody = []
}

  onLoadBinding(){
    this.listingService.listingProperty().subscribe((responseData)=>{
        this.responseBody = responseData.body;
    })
  }

  detailPage(id,resource_name){
    let obj = {
      "resource_id" : id,
      "resource_name" : resource_name
    }

    this._observableDataService.passDetailData(obj);
    this._router.navigate(['detail-page']);
  }

  reset(){
    this.filterValidateForm.reset()
    this.filterValidateForm.controls['location'].setErrors(null);
    this.filterValidateForm.controls['price'].setErrors(null);
  }



}
