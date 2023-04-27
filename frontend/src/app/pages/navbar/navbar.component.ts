import {Component, Input} from '@angular/core';
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
  @Input() isConnected: boolean = false;
  currentDate = Date.now();

  constructor(private authService: AuthService, private router:Router, private userService:UserService) {
  }
  ngOnChanges() {
    this.isConnected = this.authService.getAccessToken() !== null;

  }
  async logout() {
    // Supprimez toutes les données sensibles
    this.authService.clearToken();
    this.userService.clearUserData();
    window.localStorage.clear();
    window.sessionStorage.clear();
    // Redirigez vers la page de connexion
    this.isConnected = false;
    window.location.assign('/login');

  }



}
