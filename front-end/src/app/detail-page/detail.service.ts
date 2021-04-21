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

  getDetailByObservable(param,id): Observable<any> {
    return this._restService.get(RestUrl.getDetail+param+"/"+id)
  }



}
