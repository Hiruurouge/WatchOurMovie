import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpInterceptor, HttpHandler, HttpRequest,HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';
import {UserI} from "../interface/wom";
import {GroupI} from "../interface/wom";

@Injectable({
  providedIn: 'root'
})
export class GroupService {

  apiUrl: string = 'http://localhost:3212/api/group';
  token: string =''
  constructor(private http: HttpClient, private authService: AuthService) {
    this.token = authService.getAccessToken()!
  }

  getUserGroups(): Observable<any[]> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
    return this.http.get<any[]>(`${this.apiUrl}/all?uid=16`,{headers});
  }

  createGroup(groupName: string): Observable<any> {
    let group:GroupI= {
      "uid": 0,
      "group_name": groupName,
      "owner": 0
    }
    const headerDict = {
      'Accept': '*/*',
      'Authorization': 'Bearer ' + this.authService.getAccessToken()
    }

    const requestOptions = {
      headers: new HttpHeaders(headerDict),
    };

    return this.http.post<any>("http://localhost:3212/api/group/", { "uid":0,"group_name":groupName,"owner":0 },requestOptions)
  }
  createGroup2(group: GroupI): Observable<any> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
    return this.http.post<any>(this.apiUrl, group, { headers });
  }

  deleteGroup(groupId: number): Observable<any> {
    const options = {
      headers: new HttpHeaders({
        'Authorization': `Bearer ${this.token}`,
        'Content-Type': 'application/json'
      }),
      body: {
        "uid": groupId
      }
    };
    return this.http.delete<any>(this.apiUrl, options);
  }

  updateGroup(group: any): Observable<any> {
    return this.http.patch<any>(`${this.apiUrl}/${group.id}`, group);
  }

}

/*@Injectable()
export class TokenInterceptor implements HttpInterceptor {

  constructor(private authService: AuthService) { }

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const authToken = this.authService.getToken();
    if (authToken) {
      console.log(authToken)
      const authRequest = request.clone({
        headers: new HttpHeaders({
          'Authorization': `Bearer ${authToken.accessToken}`
        })
      });
      return next.handle(authRequest);
    }
    return next.handle(request);
  }

}*/
