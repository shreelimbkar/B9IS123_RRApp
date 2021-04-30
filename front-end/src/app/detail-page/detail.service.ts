import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { RestUrl } from '../shared/rest-url-constant';
import { RestService } from '../shared/rest.service';


@Injectable({
  providedIn: 'root'
})

export class DetailService {

  constructor( private _restService : RestService) {
  }

  getDetailByObservable(id): Observable<any> {
    return this._restService.get(RestUrl.getResourceById+id)
  }

  getDetailByBNBID(id): Observable<any> {
    return this._restService.get(RestUrl.getBNBResourceById+id)
  }

  getUserReview(id): Observable<any> {
    return this._restService.get(RestUrl.getUserReview+id)
  }



}
