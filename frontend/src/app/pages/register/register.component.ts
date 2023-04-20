import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import * as bcrypt from 'bcryptjs';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent {
  email: string='';
  password: string='';
  firstName: string='';
  lastName: string='';
  genre: string='';
  age: number=0;

  constructor(private http: HttpClient) { }

  onSubmit() {
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
        },
        (error) => {
          console.error(error);
        }
      );
  }
}
