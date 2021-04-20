import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  hide = true;
  constructor(private _route: Router) { }

  ngOnInit(): void {
  }

  signUp(){
    this._route.navigate(['/signUp'])
  }
}
