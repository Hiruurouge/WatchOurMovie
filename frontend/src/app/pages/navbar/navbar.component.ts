import { Component } from '@angular/core';
import {OnInit} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {AuthService} from "../../services/auth.service";
import {UserService} from "../../services/user.service";
import {OnChanges} from "@angular/core";
import {Router} from "@angular/router";

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent implements  OnChanges{
  isConnected:boolean=false
  constructor(private authService: AuthService, private router:Router) {
    this.isConnected = this.authService.getAccessToken() !== null;
  }
  ngOnChanges() {
    this.isConnected = this.authService.getAccessToken() !== null;

  }
  logout() {
    sessionStorage.clear();
    this.isConnected = false;
    this.router.navigate(['/login']);
  }


}
