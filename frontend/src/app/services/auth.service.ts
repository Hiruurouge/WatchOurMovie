import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private token: { accessToken: string, tokenType: string } = {accessToken:" ",tokenType:" "};

  constructor() { }

  setToken(token: { accessToken: string, tokenType: string }) {
    this.token = token;
    console.log(this.token)
  }

  getToken() {
    return this.token;
  }
}
