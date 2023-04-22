import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { GenreI } from '../interface/wom';
import {AuthService} from "./auth.service";

@Injectable({
  providedIn: 'root'
})
export class GenrePreferenceService {
  private baseUrl = 'http://localhost:3212/api/like/genre';
  token:string=''
  private  headers = new HttpHeaders({
    'Authorization': `Bearer ${this.token}`,
    'Content-Type': 'application/json'
  });

  constructor(private http: HttpClient, private authService: AuthService) {
    this.token = authService.getAccessToken()!
  }

  getGenrePreferences(): Observable<any> {
    const headerDict = {
      'Accept': '*/*',
      'Authorization': 'Bearer ' + this.authService.getAccessToken()
    }

    const requestOptions = {
      headers: new HttpHeaders(headerDict),
    };
    return this.http.get<any>(`${this.baseUrl}`, requestOptions);
  }

  addGenrePreference(genres: GenreI): Observable<any> {
    const headerDict = {
      'Accept': '*/*',
      'Authorization': 'Bearer ' + this.authService.getAccessToken()
    }

    const requestOptions = {
      headers: new HttpHeaders(headerDict),
    };
    console.log(genres)
    return this.http.post<any>(`${this.baseUrl}`, [{"uid":genres.uid}], requestOptions);
  }

  deleteGenrePreference(genre: GenreI): Observable<any> {
    const headerDict = {
      'Accept': '*/*',
      'Authorization': 'Bearer ' + this.authService.getAccessToken()
    }

    const options = {
      headers: new HttpHeaders(headerDict),
      body: {"uid":genre.uid}
    };
    return this.http.delete<any>(`${this.baseUrl}`, options);
  }
}
