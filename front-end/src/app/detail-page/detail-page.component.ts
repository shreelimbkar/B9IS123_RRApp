import { Component, OnDestroy, OnInit } from '@angular/core';
import { Gallery, GalleryItem, ImageItem, ThumbnailsPosition, ImageSize } from 'ng-gallery';
import { Lightbox } from 'ng-gallery/lightbox';
import {MatDialog, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { BookingComponent } from '../booking/booking.component';
import { ObservableDataService } from '../observable/behaviourSubject.service';
import { DetailService } from './detail.service';
import { SubscriptionLike } from 'rxjs';

@Component({
  selector: 'app-detail-page',
  templateUrl: './detail-page.component.html',
  styleUrls: ['./detail-page.component.css']
})
export class DetailPageComponent implements OnInit, OnDestroy {

  detailsPage;
  items: GalleryItem[];
  imageData;
  facilities
  responseBody = {
    type : null,
    Price: null,
    address: null,
    description: null,
    images: null,
    features:null
  };
  observ: SubscriptionLike;

  constructor(public gallery: Gallery, public lightbox: Lightbox, private _detailService : DetailService,
    private dialog: MatDialog, private _observableDataService : ObservableDataService)
     {

    }

  ngOnInit(): void {

    this.observ = this._observableDataService.detailPageData.subscribe((requestParam)=>{

      if(requestParam != null){
        this._detailService.getDetailByObservable(requestParam.param, requestParam.id).subscribe((responseData)=>{
          this.responseBody = responseData;
          this.imageData = this.responseBody.images.map((elements) => {
              return { "srcUrl": elements, "previewUrl": elements }
          })
          this.facilities = this.responseBody.features;
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

  ngOnDestroy() {
    this.observ.unsubscribe()
  }

  openDialog() {
    this.dialog.open(BookingComponent, {
    });
  }

}

