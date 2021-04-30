import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { RegexConstant } from '../shared/constant/regex-constant';
import { SignUpService } from './sign-up.service'
@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {
  hide = true;
  signUpValidateForm;
  otpValidationForm;
  isOTP : boolean = false;
  constructor( public formBuilder: FormBuilder, private _service : SignUpService, private _route: Router) {
  }

  ngOnInit(): void {

    this.signUpValidateForm = this.formBuilder.group({
      username : ['', [Validators.required]],
      email : ['', [Validators.required, Validators.email]],
      contact : ['', [Validators.required, this.mobileNumber]],
      password : ['', [Validators.required,this.passwordPattern]],
      confirmPassword : ['', [Validators.required, this.matchPassword]]
    })

    this.otpValidationForm = this.formBuilder.group({
      otp_code : ['',[Validators.required]]
    });
  }

  submitForm(value){
    let paramObj = {
      username : value.username,
      email : value.email,
      contact : value.contact,
      password : value.password
    }

    this._service.signUp(paramObj).subscribe((responseObject)=>{
     if(responseObject.status == 200){
          this.isOTP = !this.isOTP
        } else {
          alert("Somthing went wrong in Sign UP! ");
        }

    })
  }

  submitOTPForm(value){
    if(value != null){
      this._service.sendOTP(value).subscribe((responseData)=>{
        if(responseData.status == 200){
          this._route.navigate(["/login"]);
          this.isOTP = !this.isOTP
        } else {
           alert("Somthing went wrong in OTP! ");
           this.isOTP = !this.isOTP
          }
      })
    }
  }

  backToLogin(){
    this._route.navigate(["/login"])
  }

  passwordPattern = (control: FormControl): {[s: string]: boolean} => {
    if(!control.value) {
      return { required: true };
    }else if (control.value.match(RegexConstant.PASSWORD_REGEX)){
      return {};
    }else{
      return { passErr: true, error: true };
    }
  }

  mobileNumber = (control: FormControl): {[s: string]: boolean} => {

    if(!control.value) {
      return { required: true };
    } else if (control.value.match(RegexConstant.ONLY_NUMBER)){
      return {};
    } else {
      return { mobileErr: true, error: true };
    }
  }

  matchPassword =  (control: FormControl): {[s: string]: boolean} => {

    if(!control.value) {
      return { required: true };
    } else if (control.value.match(this.signUpValidateForm.value.password)){
      return {};
    } else {
      return { confirmPassErr: true, error: true };
    }
  }

}
