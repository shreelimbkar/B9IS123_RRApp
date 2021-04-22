import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { RestUrl } from '../shared/rest-url-constant';
import { RestService } from '../shared/rest.service';


@Injectable({
  providedIn: 'root'
})

export class ListingService {

  constructor( private _restService : RestService) {
  }

  listingProperty(): Observable<any> {
    return this._restService.get(RestUrl.mightBeLike)
  }

  listBySection(param):Observable<any>{
    return this._restService.get("resources?category="+`'${param}'`)
  }

  listBySectionBNB(param):Observable<any>{
    return this._restService.get("resources/"+param)
  }

  listByFilter(param):Observable<any>{
    return this._restService.get("/"+param)
  }

  listByPriceFilterURLAsc(urlParam):Observable<any>{
    return this._restService.get("/"+urlParam+RestUrl.ascendingSort)
  }

  listByPriceFilterURLDesc(urlParam):Observable<any>{
    return this._restService.get("/"+urlParam+RestUrl.descendingSort)
  }

  listByPriceFilterAsc(urlParam):Observable<any>{
    return this._restService.get(urlParam+RestUrl.ascendingSort)
  }

  listByPriceFilterDesc(urlParam):Observable<any>{
    return this._restService.get(urlParam+RestUrl.descendingSort)
  }


}
