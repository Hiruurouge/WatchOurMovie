import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {AuthService} from "./auth.service";
import {UserService} from "./user.service";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class StaffService {

  apiUrl: string = 'http://localhost:3212/api/staff';
  token: string =''
  constructor(private http: HttpClient, private authService: AuthService, private userService:UserService) {
    this.token = authService.getAccessToken()!
  }

  getAllStaff(): Observable<any[]> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
    this.userService.getUser()
    return this.http.get<any[]>(`${this.apiUrl}/all`,{headers});
  }

}
