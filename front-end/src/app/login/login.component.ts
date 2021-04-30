import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { RegexConstant } from '../shared/constant/regex-constant';
import { LoginService } from './login.service'
import { ThrowStmt } from '@angular/compiler';
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

    this._service.login(value).subscribe((responseData)=>{
      if(responseData.status == 200){
        localStorage.setItem("user",value.email);
        location.reload();
        alert(`${value.email} Logged In Successfully`)
        this._route.navigate([''])
      } else {
        alert("Somthing Went Worng in Login!")
      }


    })

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
}
