import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { RestUrl } from '../shared/rest-url-constant';
import { RestService } from '../shared/rest.service';


@Injectable({
  providedIn: 'root'
})

export class HomeService {

  constructor( private _restService : RestService) {
  }

  mostViewed(): Observable<any> {
    return this._restService.get(RestUrl.mostViewedProperty)
  }

  mightBeLike(): Observable<any> {
    return this._restService.get(RestUrl.mightBeLike)
  }

  clubsNearYou(): Observable<any> {
    return this._restService.get(RestUrl.getClubsDetails)
  }

  bnbNearYou(): Observable<any> {
    return this._restService.get(RestUrl.getAllBNB)
  }

  restaurantsNearYou(): Observable<any> {
    return this._restService.get(RestUrl.getRestaurantsDetails)
  }

  hotelsNearYou(): Observable<any> {
    return this._restService.get(RestUrl.getHotelsDetails)
  }




}
