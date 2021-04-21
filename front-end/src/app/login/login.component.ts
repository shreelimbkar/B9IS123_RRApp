import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { RegexConstant } from '../shared/constant/regex-constant';
import { LoginService } from './login.service'
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  hide = true;
  loginValidateForm
  constructor(private _route: Router, public formBuilder: FormBuilder, private _service : LoginService) { }

  ngOnInit(): void {
    this.loginValidateForm = this.formBuilder.group({
      email : ['', [Validators.required, Validators.email]],
      password : ['', [Validators.required,this.passwordPattern]]
    })
  }

  signUp(){
    this._route.navigate(['/signUp'])
  }
  submitForm(value){
    console.log("value ", value)

    this._service.login(value).subscribe((responseData)=>{
      console.log("responseData ", responseData)

    })

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
}
