import { Component, OnDestroy, OnInit } from '@angular/core';
import { Gallery, GalleryItem, ImageItem, ThumbnailsPosition, ImageSize } from 'ng-gallery';
import { Lightbox } from 'ng-gallery/lightbox';
import {MatDialog, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { BookingComponent } from '../booking/booking.component';
import { ObservableDataService } from '../observable/behaviourSubject.service';
import { DetailService } from './detail.service';
import { SubscriptionLike } from 'rxjs';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import * as moment from 'moment';
import { Router } from '@angular/router';

@Component({
  selector: 'app-detail-page',
  templateUrl: './detail-page.component.html',
  styleUrls: ['./detail-page.component.css']
})
export class DetailPageComponent implements OnInit {

  detailsPage;
  items: GalleryItem[];
  imageData;
  facilities;
  responseBody = {
    resource_name : null,
    resource_category : null,
    resource_city_code : null,
    city_name : null,
    resource_address : null,
    resource_details : null,
    resource_images : null,
    resource_is_active : null,
    resource_review : null,
    resource_price : null,
    resource_id : null,
    bnb_id : null,
    bnb_name : null,
    bnb_amenities : null,
    bnb_room_features : null,
    bnb_city_code : null,
    bnb_address : null,
    contact_number : null,
    bnb_price_range : null,
  };
  bnbResponseBody = {};
  observ: SubscriptionLike;
  form: FormGroup;
  roomFeatures;
  propertyAmenities;
  bnb_amenities;
  cuisines;
  features;
  meals;
  specialDiets;
  reviewResponseBody;

  images = [
		{
			path: '../../assets/image/bars/bar1/bar_1.jpeg'
		},
		{
			path: '../../assets/image/BB/BB1/1.jpeg'
		},
		{
			path: '../../assets/image/clubs/club1/1.jpeg'
		},
		{
			path: '../../assets/image/hotels/hotel1/1.jpeg'
		},
		{
			path: '../../assets/image/bars/bar1/bar_4.jpeg'
		},
		{
			path: '../../assets/image/hotels/hotel1/hotel_2.jpeg'
		},
		{
			path: '../../assets/image/bars/bar2/1.jpeg'
		},
		{
			path: '../../assets/image/hotels/hotel2/hotel_10.jpeg'
		},
	];
  selectedValue: string;

  rooms = [
    {value: '1', viewValue: '1'},
    {value: '2', viewValue: '2'},
    {value: '3', viewValue: '3'},
    {value: '4', viewValue: '4'},
    {value: '5', viewValue: '5'},
    {value: '6', viewValue: '6'}
  ];

  adults = [
    {value: '1', viewValue: '1'},
    {value: '2', viewValue: '2'},
    {value: '3', viewValue: '3'},
    {value: '4', viewValue: '4'},
    {value: '5', viewValue: '5'},
    {value: '6', viewValue: '6'}
  ];

  childrens = [
    {value: '1', viewValue: '1'},
    {value: '2', viewValue: '2'},
    {value: '3', viewValue: '3'},
    {value: '4', viewValue: '4'},
    {value: '5', viewValue: '5'},
    {value: '6', viewValue: '6'}
  ];

  constructor(private _route: Router, public gallery: Gallery, public lightbox: Lightbox, private _detailService : DetailService,
    private dialog: MatDialog, private _observableDataService : ObservableDataService, private fb: FormBuilder)
     {
      this.form = this.fb.group({
        selected: [{
          startDate: moment(),
          endDate: moment()
        }, Validators.required],
        rooms : ['', [Validators.required]],
        adults : ['', [Validators.required]],
        children : ['', [Validators.required]],
        splRequirement : ['', [Validators.required]]
      });
     }

    submit() {
      console.log(this.form.value);
    }

  ngOnInit(): void {


    this.observ = this._observableDataService.detailPageData.subscribe((requestParam)=>{
      console.log("requestParam ++++", requestParam);

      if(requestParam == null){
        requestParam = JSON.parse(localStorage.getItem("resourceData"));
      }

      if(requestParam.resource_name != 'bnb'){
        localStorage.setItem("resourceData",JSON.stringify(requestParam));
        this.getUserReview(requestParam.resource_id);
        this._detailService.getDetailByObservable(requestParam.resource_id).subscribe((responseData)=>{
          console.log("Deatail page ", responseData);

          this.responseBody = responseData.body[0];
          console.log("Deatail page 2", this.responseBody);
          // if(this.responseBody.resource_category != null){

          // }
          this.imageData = this.images.map((elements) => {
            console.log("element +++ ",elements)
              return { "srcUrl": elements.path, "previewUrl": elements.path }
          })
          this.facilities = JSON.parse(this.responseBody.resource_details);
          console.log("this.facilities ",this.facilities)
          if(this.facilities.propertyAmenities) {
            this.propertyAmenities = Object.values(this.facilities.propertyAmenities)
            this.roomFeatures = Object.values(this.facilities.roomFeatures)
          } else {
            this.cuisines = Object.values(this.facilities.Cuisines)
            this.features = Object.values(this.facilities.Features)
            this.meals = Object.values(this.facilities.Meals)
            this.specialDiets = Object.values(this.facilities.specialDiets)
          }
          // Creat gallery items
          this.items = this.imageData.map(item => new ImageItem({ src: item.srcUrl, thumb: item.previewUrl }));
          // Get a lightbox gallery ref
          const lightboxRef = this.gallery.ref('lightbox');
          // Add custom gallery config to the lightbox (optional)
          lightboxRef.setConfig({
            imageSize: ImageSize.Contain,
            thumbPosition: ThumbnailsPosition.Bottom
          });
          // Load items into the lightbox gallery ref
          lightboxRef.load(this.items);

        })
      } else {
        this.getUserReview(requestParam.resource_id);
        this._detailService.getDetailByBNBID(requestParam.resource_id).subscribe((responseData)=>{
          console.log("Deatail page ", responseData);

          this.responseBody = responseData.body[0];
          console.log("Deatail page 2", this.responseBody);

          this.imageData = this.images.map((elements) => {
            console.log("element +++ ",elements)
              return { "srcUrl": elements.path, "previewUrl": elements.path }
          })
          this.facilities = JSON.parse(this.responseBody.bnb_amenities);
          console.log("this.facilities ",this.facilities)
            this.cuisines = Object.values(this.facilities.Cuisines)
            this.features = Object.values(this.facilities.Features)
            this.meals = Object.values(this.facilities.Meals)
            this.specialDiets = Object.values(this.facilities.specialDiets)
          // Creat gallery items
          this.items = this.imageData.map(item => new ImageItem({ src: item.srcUrl, thumb: item.previewUrl }));
          // Get a lightbox gallery ref
          const lightboxRef = this.gallery.ref('lightbox');
          // Add custom gallery config to the lightbox (optional)
          lightboxRef.setConfig({
            imageSize: ImageSize.Contain,
            thumbPosition: ThumbnailsPosition.Bottom
          });
          // Load items into the lightbox gallery ref
          lightboxRef.load(this.items);

        })
      }
    })
  }

  getUserReview(id){

    this._detailService.getUserReview(id).subscribe((responseObject)=>{
        console.log("responseObject ",responseObject);
        this.reviewResponseBody = responseObject.body;

    })

  }

  writeReviewForm(){
    let sourceBody = this.responseBody;
    this._observableDataService.passDetailData(sourceBody);
    this._route.navigate(["write-review"])
  }


  // ngOnDestroy() {
  //   this.observ.unsubscribe()
  // }

  openDialog() {
    this.dialog.open(BookingComponent, {
    });
  }

  toggleDisable(form: FormGroup) {
    if (form.disabled) {
      form.enable();
    } else {
      form.disable();
    }
  }

}

