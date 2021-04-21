import { Component, OnInit } from '@angular/core';
import { OwlOptions } from 'ngx-owl-carousel-o';
import { Router } from '@angular/router'
import { HomeService } from './home.service'
import { ObservableDataService } from '../observable/behaviourSubject.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  imageTest
  mostViewedBody = [{
    id : "1",
    images : ["../assets/image/bars/bar_1.jpeg"],
    Price : "200",
    type : "Restaurent",
    name: "Name",
    address: "Dublin"
  },
  {
    id : "2",
    images : ["../assets/image/bars/bar_2.jpeg"],
    Price : "500",
    type : "Bar",
    name: "Name",
    address: "Dublin"
  },
  {
    id : "3",
    images : ["../assets/image/bars/bar_3.jpeg"],
    Price : "600",
    type : "Hotel",
    name: "Name",
    address: "Dublin"
  },
  {
    id : "4",
    images : ["../assets/image/bars/bar_4.jpeg"],
    Price : "300",
    type : "B&B",
    name: "Name",
    address: "Cork"
  },
  {
    id : "5",
    images : ["../assets/image/bars/bar_1.jpeg"],
    Price : "600",
    type : "Hotel",
    name: "Name",
    address: "Waterford"
  },
  {
    id : "6",
    images : ["../assets/image/bars/bar_5.jpeg"],
    Price : "600",
    type : "B&B",
    name: "Name",
    address: "Galway"
  },
  {
    id : "7",
    images : ["../assets/image/bars/bar_6.jpeg"],
    Price : "600",
    type : "Restaurent",
    name: "Name",
    address: "Limerick"
  },
  {
    id : "8",
    images : ["../assets/image/bars/bar_7.jpeg"],
    Price : "600",
    type : "Hotel",
    name: "Name",
    address: "Waterford"
  }
]


clubHouse = [{
  id: "1",
  image : ["https://material.angular.io/assets/img/examples/shiba2.jpg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
},
{
  id: "2",
  image : ["https://material.angular.io/assets/img/examples/shiba2.jpg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
},
{
  id: "3",
  image : ["https://material.angular.io/assets/img/examples/shiba2.jpg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
},
{
  id: "4",
  image : ["https://material.angular.io/assets/img/examples/shiba2.jpg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
},
{
  id: "5",
  image : ["https://material.angular.io/assets/img/examples/shiba2.jpg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
},
{
  id: "6",
  image : ["https://material.angular.io/assets/img/examples/shiba2.jpg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
}
]


  constructor(private _route: Router, private _service : HomeService, private _observableDataService : ObservableDataService) { }

  ngOnInit(): void {
    this.onLoadBidding()
  }

  onLoadBidding(){
    // this._service.mightBeLike().subscribe((resposneData)=>{
    //   console.log("+++++++++++++",resposneData)

    //   let responseBody = resposneData;
    //   this.mostViewedBody = responseBody;
    //   // this.imageTest = responseBody[0].images[0]
    // })
  }

  writeReviewForm(){

  }

  bannerImages = [
		{
			path: '../assets/image/bars/bar_1.jpeg'
		},
		{
			path: '../assets/image/BB/BB_4.jpeg'
		},
		{
			path: '../assets/image/clubs/club_1.jpeg'
		},
		{
			path: '../assets/image/hotels/hotel_1.jpeg'
		},
		{
			path: '../assets/image/bars/bar_2.jpeg'
		},
		{
			path: '../assets/image/hotels/hotel_3.jpeg'
		},
		{
			path: '../assets/image/bars/bar_3.jpeg'
		},
		{
			path: '../assets/image/hotels/hotel_4.jpeg'
		},
	];


  customOptions: OwlOptions = {
    loop: true,
    mouseDrag: true,
    touchDrag: true,
    pullDrag: false,
    dots: false,
    navSpeed: 700,
    navText: ['<', '>'],
    responsive: {
      0: {
        items: 1
      },
      400: {
        items: 2
      },
      740: {
        items: 3
      },
      940: {
        items: 4
      }
    },
    nav: true
  }

  ViewAll(){
    this._route.navigate(['listing'])
  }

  mostViewDetailPage(id){

    let obj = {
      "id" : id,
      "param" : "mostViewedProperty"
    }

    this._observableDataService.passDetailData(obj);
    this._route.navigate(['detail-page']);
  }

  browserSection(param){
    let obj = {
      "param" : param
    }
    this._observableDataService.passDetailData(obj);
    this._route.navigate(['listing'])
  }


}
