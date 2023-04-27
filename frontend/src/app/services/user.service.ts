import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders, HttpResponse} from '@angular/common/http';
import { Observable } from 'rxjs';
import {AuthService} from "./auth.service";
import { UserI} from "../interface/wom";

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private apiUrl = 'http://localhost:3212/api/user';
  token: string= '';
  user: UserI = <UserI>{};
  constructor(private http: HttpClient, public  authService:AuthService) {
    this.token = authService.getAccessToken()!
    this.getUser()
  }

  createUser(user: UserI): Observable<any> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
    return this.http.post<any>(this.apiUrl, user, { headers });
  }

  async getUser(): Promise<void> {
    //const params = { uid: String(this.token) };
    const headerDict = {
      'Accept': '*/*',
      'Authorization': 'Bearer ' + this.authService.getAccessToken()
    }

    const requestOptions = {
      headers: new HttpHeaders(headerDict),
    };

     await this.http.get<any>("http://localhost:3212/api/user/", requestOptions).toPromise().then((rep)=>this.user=rep)
    console.log(this.user)
  }

  updateUser(user: UserI): Observable<any> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
    return this.http.patch<any>(this.apiUrl, user, { headers });
  }

  deleteUser(): Observable<any> {
    const user = { uid: this.token };
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
    return this.http.delete<any>(this.apiUrl, { headers, body: user });
  }
  getUserByMail(mail:string): Observable<any>{
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
    return this.http.get<any>(this.apiUrl+'/mail?mail='+mail,{headers})
  }
  clearUserData()
  {
    this.user = <UserI>{}
  }

}
