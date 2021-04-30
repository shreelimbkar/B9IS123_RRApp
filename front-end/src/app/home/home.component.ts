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
  mightLikeList;
  clubsList;
  restaurantsList;
  hotelsList;
  bnbList;
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
  image : ["../assets/image/BB/BB1/1.jpeg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
},
{
  id: "2",
  image : ["../assets/image/BB/BB3/BB_14.jpeg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
},
{
  id: "3",
  image : ["../assets/image/BB/BB3/1.jpeg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
},
{
  id: "4",
  image : ["../assets/image/BB/BB4/1.jpeg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
},
{
  id: "5",
  image : ["../assets/image/BB/BB5/1.jpeg"],
  Price : "500",
  type: "Club",
  name: "Name",
  address: "Dublin"
},
{
  id: "6",
  image : ["../assets/image/BB/BB1/BB_2.jpeg"],
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


    this._service.mightBeLike().subscribe((resposneData)=>{
      console.log("+++++++++++++",resposneData)
      let responseBody =  resposneData.body
      console.log("+++++++++++++",responseBody)
      this.mightLikeList = responseBody;
    })


    this._service.clubsNearYou().subscribe((resposneData)=>{
      console.log("+++++++++++++",resposneData)
      let responseBody =  resposneData.body
      console.log("+++++++++++++",responseBody)
      this.clubsList = responseBody;
    })

    this._service.bnbNearYou().subscribe((resposneData)=>{
      console.log("+++++++++++++",resposneData)
      let responseBody =  resposneData.body
      console.log("+++++  bnbList  ++++++++",responseBody)
      this.bnbList = responseBody;
    })

    this._service.restaurantsNearYou().subscribe((resposneData)=>{
      console.log("+++++++++++++",resposneData)
      let responseBody =  resposneData.body
      console.log("++++++Restaurents+++++++",responseBody)
      this.restaurantsList = responseBody;
    })

    this._service.hotelsNearYou().subscribe((resposneData)=>{
      console.log("+++++++++++++",resposneData)
      let responseBody =  resposneData.body
      console.log("++++++Restaurents+++++++",responseBody)
      this.hotelsList = responseBody;
    })
  }




    bannerImages = [
      {
        path: '../assets/image/bars/bar1/bar_1.jpeg'
      },
      {
        path: '../assets/image/BB/BB1/1.jpeg'
      },
      {
        path: '../assets/image/clubs/club1/1.jpeg'
      },
      {
        path: '../assets/image/hotels/hotel1/1.jpeg'
      },
      {
        path: '../assets/image/bars/bar1/bar_4.jpeg'
      },
      {
        path: '../assets/image/hotels/hotel1/hotel_2.jpeg'
      },
      {
        path: '../assets/image/bars/bar2/1.jpeg'
      },
      {
        path: '../assets/image/hotels/hotel2/hotel_10.jpeg'
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

  ViewAll(param){
    let obj = {
      "param" : param
    }
   this._observableDataService.passDetailData(obj);
    this._route.navigate(['listing'])
  }

  mostViewDetailPage(id){

    let obj = {
      "resource_id" : id,
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

  viewBNBDetailPage(id){
    let obj = {
      "bnb_id" : id,
    }
    this._observableDataService.passDetailData(obj);
    this._route.navigate(['detail-page']);
  }

}
