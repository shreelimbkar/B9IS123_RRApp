import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormBuilder, FormGroup, Validators, FormControl } from '@angular/forms';

// export interface DialogData {
//   animal: 'panda' | 'unicorn' | 'lion';
// }

@Component({
  selector: 'app-booking',
  templateUrl: './booking.component.html',
  styleUrls: ['./booking.component.css']
})
export class BookingComponent implements OnInit {
  validateForm: FormGroup;

  constructor(private _formBuilder: FormBuilder, public _dialogRef: MatDialogRef<BookingComponent>) { }

  ngOnInit(): void {
    this.validateForm = this._formBuilder.group({
      name: [null, [Validators.required]],
      email: [null, [Validators.required, Validators.email]],
      contactNo:[null, [Validators.required,this.mobileNumber]],
      gender: [null, Validators.required],
      eirCode: [null, [Validators.required,this.onlyDigit]]
    })

    // this.validateForm.patchValue({
    //   name : this.userData.name,
    //   email : this.userData.email,
    //   contactNo : this.userData.contactNo
    // })

  }

  submitForm(value: any){

      for (const key in this.validateForm.controls) {
        this.validateForm.controls[key].markAsDirty();
        this.validateForm.controls[key].updateValueAndValidity();
      }

      this._dialogRef.close();
      alert("Booking Successfully Done!")

  }

  resetForm(e: MouseEvent): void {
    e.preventDefault();
    this.validateForm.reset();
    for (const key in this.validateForm.controls) {
      this.validateForm.controls[key].markAsPristine();
      this.validateForm.controls[key].updateValueAndValidity();
    }
  }

  onlyDigit= (control: FormControl): {[s: string]: boolean} => {


      if(!control.value) {
        return { required: true };
      } else if (control.value.match("(?:^[AC-FHKNPRTV-Y][0-9]{2}|D6W)[ -]?[0-9AC-FHKNPRTV-Y]{4}$")){
        return {};
      } else {

        return { expErr: true, error: true };
      }
  }

  mobileNumber= (control: FormControl): {[s: string]: boolean} => {


      if(!control.value) {
        return { required: true };
      } else if (control.value.match("^[0-9]{10}$")){
        return {};
      } else {

        return { mobileErr: true, error: true };
      }
  }


}
