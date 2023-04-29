import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../services/auth.service';
import {Router} from "@angular/router";
import {animate, keyframes, state, style, transition, trigger} from "@angular/animations";
import * as bcrypt from "bcryptjs";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  animations: [
    trigger('slide',[
      state('left', style({transform:'translate(0%)'})),
      state('right', style({transform:'translate(100%)'})),
      transition('left => right',animate('1s ease-in-out', keyframes([style({transform:'translateX(100%)'})]))),
      transition('right => left',animate('1s ease-in-out', keyframes([style({transform:'translateX(0%)'})])))
    ])
  ]
})
export class LoginComponent {
  username: string = '';
  password: string = '';
  isRegister:boolean = true;
  email: string='';
  firstName: string='';
  lastName: string='';
  genre: string='';
  age: number=0;

  constructor(private http: HttpClient, private userService: AuthService,private  router:Router) { }

  onLogin() {
    const formData = new FormData();
    formData.append('username', this.username);
    formData.append('password', this.password);
    this.http.post('http://localhost:3212/api/auth/login', formData)
      .subscribe({
        next: (response: any) => {
          const accessToken = response.access_token;
          const tokenType = response.token_type;
          this.userService.setToken({ accessToken, tokenType });
          this.router.navigate(['like'])
          
        },
        error: (error) => {
          console.error(error);
        }
      });
  }
  onRegister() {
    //const salt = bcrypt.genSaltSync(10);
    const hashedPassword = bcrypt.hashSync(this.password);

    const formData = {
      auth: {
        email: this.email,
        password: hashedPassword
      },
      user: {
        uid:0,
        first_name: this.firstName,
        last_name: this.lastName,
        genre: this.genre,
        age: this.age
      }
    };

    console.log(formData)

    this.http.post('http://localhost:3212/api/auth/signup', formData)
      .subscribe(
        (response: any) => {
          console.log(response);
          this.router.navigate(['login'])
        },
        (error) => {
          console.error(error);
        }
      );
    this.toggle()
  }

  toggle():void{
    this.isRegister = ! this.isRegister
    console.log(this.isRegister)
  }

}
