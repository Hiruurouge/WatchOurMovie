import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import {AuthService} from "./auth.service";


@Injectable({
  providedIn: 'root'
})
export class PredictionService {

  private apiUrl = 'http://localhost:3212/api/predict';
  token: string = ''
  constructor(private http: HttpClient, private  authService:AuthService) {
    this.token = authService.getAccessToken()!

  }

  getRecommendation(preferences: any, groupId: string | null = null): Observable<any> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
    if(groupId !== null)
    {
      return this.http.post<any>(this.apiUrl+'?groupId='+groupId, preferences, {headers});

    }
    return this.http.post<any>(this.apiUrl, preferences, {headers});
  }
}
