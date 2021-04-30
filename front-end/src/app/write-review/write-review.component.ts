import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ObservableDataService } from '../observable/behaviourSubject.service';
import { WriteReviewService } from './write-review.service'

@Component({
  selector: 'app-write-review',
  templateUrl: './write-review.component.html',
  styleUrls: ['./write-review.component.css']
})
export class WriteReviewComponent implements OnInit {
  sourceBody;
  reviewForm;
  reviewRating = ['1','2','3','4','5'];
  reviewBudget = ['Budget','Mid-range','Luxury'];
  constructor(private _service : WriteReviewService, private formBuilder: FormBuilder, private _route: Router, private _observableDataService : ObservableDataService) { }

  ngOnInit(): void {
   this._observableDataService.detailPageData.subscribe((requestParam)=>{
      this.sourceBody = requestParam
    })

    this.reviewForm = this.formBuilder.group({
      review_title : ['', [Validators.required]],
      review_body : ['', [Validators.required]],
      budget : ['', [Validators.required]],
      user_rating : ['', [Validators.required]]
    })

  }

  submitReview(value){
    console.log("value of review",value);
    value["user_review_user_id"] = 1001;
    value["listing_id"] = this.sourceBody.resource_id ? this.sourceBody.resource_id : this.sourceBody.bnb_id;
    value["like_count"] = '1'
    console.log("value of review",value);

    this._service.writeReview(value).subscribe((responseBody)=>{
        console.log("responseBody ++++++ ",responseBody)
        if(responseBody.status = 200){
          alert("Your Review added successful!")
          this._route.navigate([''])
        }
    })
  }




}
