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
  constructor(private authService: AuthService, private router:Router) {
  }
  ngOnChanges() {
    this.isConnected = this.authService.getAccessToken() !== null;

  }
  logout() {
    this.authService.clearToken()
    this.isConnected = false;
    this.router.navigate(['/login']);
  }


}
