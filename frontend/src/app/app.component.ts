import { Component, OnInit } from '@angular/core';
import { AuthService } from './services/auth.service';
import {Router} from "@angular/router";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  constructor(private authService: AuthService, private  router: Router) {}

  title = 'WomFront';
  isConnected = false;
  wantRegister = false;
  ngOnInit() {
    this.authService.isConnected$.subscribe((isLoggedIn) => {
      this.isConnected = isLoggedIn;
    });
  }
  register()
  {
    this.wantRegister = true;
    this.router.navigate(['register'])
  }
}
