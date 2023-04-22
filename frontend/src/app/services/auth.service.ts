import { Injectable } from '@angular/core';
import { Observable, BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private token: { accessToken: string, tokenType: string } = { accessToken: "", tokenType: "" };
  private isConnectedSubject = new BehaviorSubject<boolean>(false);
  public isConnected$ = this.isConnectedSubject.asObservable();

  constructor() {
    const accessToken = sessionStorage.getItem("accessToken");
    if (accessToken) {
      this.token.accessToken = accessToken;
      this.isConnectedSubject.next(true);
    }
  }

  setToken(token: { accessToken: string, tokenType: string }) {
    this.token = token;
    console.log(this.token);
    sessionStorage.setItem("accessToken", token.accessToken);
    this.isConnectedSubject.next(true);
  }

  getToken() {
    return this.token;
  }

  getAccessToken() {
    if (this.token.accessToken == "") {
      return sessionStorage.getItem("accessToken");
    } else {
      return this.token.accessToken;
    }
  }

  clearToken() {
    this.token = { accessToken: "", tokenType: "" };
    sessionStorage.removeItem("accessToken");
    this.isConnectedSubject.next(false);
  }
}
