import { Component } from '@angular/core';
import {OnInit} from "@angular/core";
import {HttpClient} from "@angular/common/http";
import {AuthService} from "../../services/auth.service";
import {UserService} from "../../services/user.service";

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent{
  isConnected:boolean=false
  constructor(private authService: AuthService) {
    this.isConnected = this.authService.getAccessToken() !== null;

  }


}
