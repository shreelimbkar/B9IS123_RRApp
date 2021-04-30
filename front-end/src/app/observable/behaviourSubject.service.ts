import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class ObservableDataService {

  private messageSource = new BehaviorSubject<any>(null);

  detailPageData = this.messageSource.asObservable();

  constructor() { }

  passDetailData(message: any) {
    this.messageSource.next(message);
  }





}
