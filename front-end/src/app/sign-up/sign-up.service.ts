import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { RestUrl } from '../shared/rest-url-constant';
import { RestService } from '../shared/rest.service';


@Injectable({
  providedIn: 'root'
})

export class SignUpService {

  constructor( private _restService : RestService) {
  }

  signUp(param): Observable<any> {
    return this._restService.create(RestUrl.signUp,param)
  }

}
