import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpInterceptor, HttpHandler, HttpRequest,HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';
import {UserI} from "../interface/wom";
import {GroupI} from "../interface/wom";
import {UserService} from "./user.service";

@Injectable({
  providedIn: 'root'
})
export class GroupService {

  apiUrl: string = 'http://localhost:3212/api/group';
  token: string =''
  constructor(private http: HttpClient, private authService: AuthService, private userService:UserService) {
    this.token = authService.getAccessToken()!
  }

   getUserGroups(): Observable<any[]> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
     this.userService.getUser()
    let user = this.userService.user
    return this.http.get<any[]>(`${this.apiUrl}/all?uid=${user.uid}`,{headers});
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
    const accessToken = this.authService.getAccessToken();
    const headers = {
      'accept': 'application/json',
      'Authorization': `Bearer ${accessToken}`,
      'Content-Type': 'application/json'
    };
    const body = {
      'uid': group.uid,
      'group_name': group.group_name,
      'owner': group.owner
    };
    return this.http.patch<any>("http://localhost:3212/api/group/", body, { headers });
  }
  getGroupMembers(group: any): Observable<any> {
    const accessToken = this.authService.getAccessToken();
    const headers = {
      'accept': 'application/json',
      'Authorization': `Bearer ${accessToken}`,
      'Content-Type': 'application/json'
    };
    return this.http.get<any>("http://localhost:3212/api/group/users?uid="+group.uid, { headers });
  }
    addUser(group:any,uid:number) {
      const accessToken = this.authService.getAccessToken();
      const headers = {
        'accept': 'application/json',
        'Authorization': `Bearer ${accessToken}`,
        'Content-Type': 'application/json'
      };
      return this.http.post<any>(this.apiUrl+'/add', { "users": [ { "uid": uid } ], "group": { "uid": group.uid } }, { headers });
    }

}

