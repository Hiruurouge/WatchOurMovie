import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private token: { accessToken: string, tokenType: string } = {accessToken:" ",tokenType:" "};

  constructor() { }

  setToken(token: { accessToken: string, tokenType: string }) {
    this.token = token;
    console.log(this.token);
    sessionStorage.setItem("accessToken", token.accessToken);
  }

  getToken() {
    return this.token;
  }

  getAccessToken() {
    if (this.token.accessToken == " ") {
      return sessionStorage.getItem("accessToken")
    } else {
      return this.token.accessToken
    }
  }
  getAccessTokenObservable(): Observable<string> {
    return this.token.accessToken as unknown as Observable<string>
  }
}
