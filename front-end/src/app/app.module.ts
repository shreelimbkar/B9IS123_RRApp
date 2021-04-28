import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import  { MaterialModule } from './material.module'
import { CarouselModule } from 'ngx-owl-carousel-o';

import {IvyCarouselModule} from 'angular-responsive-carousel';
import { HomeComponent } from './home/home.component';
import { GalleryModule } from 'ng-gallery';
import { LightboxModule } from 'ng-gallery/lightbox';
import { ListingPageComponent } from './listing-page/listing-page.component';
import { DetailPageComponent } from './detail-page/detail-page.component';
import { BookingComponent } from './booking/booking.component';
import { NgxSpinnerModule } from "ngx-spinner";
import { HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http';
import { HttpIntercepterBasicAuthService } from './shared/http-intercepter-basic-auth.service';
import { LoaderInterceptorService } from './shared/loader-interceptor.service';
import { SpinnerComponent } from './spinner/spinner.component';
import { LoginComponent } from './login/login.component';
import { SignUpComponent } from './sign-up/sign-up.component';
import { WriteReviewComponent } from './write-review/write-review.component';
import { RatingModule } from 'ng-starrating';
import { NgxDaterangepickerMd } from 'ngx-daterangepicker-material';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    ListingPageComponent,
    DetailPageComponent,
    BookingComponent,
    SpinnerComponent,
    LoginComponent,
    SignUpComponent,
    WriteReviewComponent,
  ],
  imports: [
    BrowserModule,
    RatingModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    CarouselModule,
    IvyCarouselModule,
    GalleryModule,
    LightboxModule,
    ReactiveFormsModule,
    FormsModule,
    NgxDaterangepickerMd.forRoot(),
    MaterialModule,
    NgxSpinnerModule,
    HttpClientModule
  ],
  providers: [{
    provide: HTTP_INTERCEPTORS,
    useClass: HttpIntercepterBasicAuthService,
    multi: true
  }, {
    provide: HTTP_INTERCEPTORS,
    useClass: LoaderInterceptorService,
    multi: true
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }
