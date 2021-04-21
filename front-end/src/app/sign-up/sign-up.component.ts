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
  otpForm;

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

    this.otpForm = this.formBuilder.group({
      otp : ['',[Validators.required]]
    });
  }

  submitForm(value){
    console.log("submit Form ",value);
    let paramObj = {
      username : value.username,
      email : value.email,
      contact : value.contact,
      password : value.password
    }
    console.log("submit Form ",value);

    this._service.signUp(paramObj).subscribe((responseObject)=>{
     console.log("responseObject+++++ ",responseObject);

    })
  }

  backToLogin(){
    this._route.navigate(["/login"])
  }

  passwordPattern = (control: FormControl): {[s: string]: boolean} => {
    console.log("passwordPattern ----->",control.value)
    if(!control.value) {
      return { required: true };
    }else if (control.value.match(RegexConstant.PASSWORD_REGEX)){
      return {};
    }else{
      return { passErr: true, error: true };
    }
  }

  mobileNumber = (control: FormControl): {[s: string]: boolean} => {
    console.log("control.value ----->",control.value)

    if(!control.value) {
      return { required: true };
    } else if (control.value.match(RegexConstant.ONLY_NUMBER)){
      return {};
    } else {
      return { mobileErr: true, error: true };
    }
  }

  matchPassword =  (control: FormControl): {[s: string]: boolean} => {
    console.log("control.value ----->",control.value)

    if(!control.value) {
      return { required: true };
    } else if (control.value.match(this.signUpValidateForm.value.password)){
      return {};
    } else {
      return { confirmPassErr: true, error: true };
    }
  }

}
