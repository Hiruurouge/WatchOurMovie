import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../services/auth.service';
import {Router} from "@angular/router";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  username: string = '';
  password: string = '';

  constructor(private http: HttpClient, private userService: AuthService,private  router:Router) { }

  onSubmit() {
    const formData = new FormData();
    formData.append('username', this.username);
    formData.append('password', this.password);
    this.http.post('http://localhost:3212/api/auth/login', formData)
      .subscribe({
        next: (response: any) => {
          const accessToken = response.access_token;
          const tokenType = response.token_type;
          this.userService.setToken({ accessToken, tokenType });
          this.router.navigate(['/'])
        },
        error: (error) => {
          console.error(error);
        }
      });
  }

}
