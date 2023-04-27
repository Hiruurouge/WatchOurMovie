import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { GenreI } from '../interface/wom';
import { AuthService } from "./auth.service";

@Injectable({
  providedIn: 'root'
})
export class GenrePreferenceService {
  private baseUrl = 'http://localhost:3212/api/like/genre';
  private productionUrl = 'http://localhost:3212/api/like/production';
  private staffUrl = 'http://localhost:3212/api/like/staff';
  private groupUrl = 'http://localhost:3212/api/like/group';
  private userUrl ='http://localhost:3212/api/like/user';
  constructor(private http: HttpClient, private authService: AuthService) {}

  private getHeaders(): HttpHeaders {
    const accessToken = this.authService.getAccessToken();
    return new HttpHeaders({
      'Authorization': `Bearer ${accessToken}`,
      'Content-Type': 'application/json'
    });
  }

  getGenrePreferences(): Observable<any> {
    const requestOptions = {
      headers: this.getHeaders()
    };
    return this.http.get<any>(`${this.baseUrl}`, requestOptions);
  }
  getUserPreferences(): Observable<any> {
    const requestOptions = {
      headers: this.getHeaders()
    };
    return this.http.get<any>(`${this.userUrl}`, requestOptions);
  }  getGroupPreferences(uid:any): Observable<any> {
    const requestOptions = {
      headers: this.getHeaders()
    };
    return this.http.post<any>(`${this.groupUrl}`,{"uid":uid}, requestOptions);
  }


  addGenrePreference(genres: GenreI): Observable<any> {
    const requestOptions = {
      headers: this.getHeaders(),
    };
    return this.http.post<any>(`${this.baseUrl}`, [{"uid":genres.uid}], requestOptions);
  }

  deleteGenrePreference(genre: GenreI): Observable<any> {
    const options = {
      headers: this.getHeaders(),
      body: {"uid":genre.uid}
    };
    return this.http.delete<any>(`${this.baseUrl}`, options);
  }

  getProductionPreferences(): Observable<any> {
    const requestOptions = {
      headers: this.getHeaders()
    };
    return this.http.get<any>(`${this.productionUrl}`, requestOptions);
  }

  addProductionPreference(productions: any[]): Observable<any> {
    const requestOptions = {
      headers: this.getHeaders(),
    };
    console.log(productions)
    return this.http.post<any>(`${this.productionUrl}`, productions, requestOptions);
  }

  deleteProductionPreference(production: any): Observable<any> {
    const options = {
      headers: this.getHeaders(),
      body: production
    };
    return this.http.delete<any>(`${this.productionUrl}`, options);
  }

  getStaffPreferences(): Observable<any> {
    const requestOptions = {
      headers: this.getHeaders()
    };
    return this.http.get<any>(`${this.staffUrl}`, requestOptions);
  }

  addStaffPreference(staffs: any[]): Observable<any> {
    const requestOptions = {
      headers: this.getHeaders(),
    };
    return this.http.post<any>(`${this.staffUrl}`, staffs, requestOptions);
  }

  deleteStaffPreference(staff: any): Observable<any> {
    const options = {
      headers: this.getHeaders(),
      body: staff
    };
    return this.http.delete<any>(`${this.staffUrl}`, options);
  }

  addGroupPreference(members: number[]): Observable<any> {
    const requestOptions = {
      headers: this.getHeaders(),
    };
    return this.http.post<any>(`${this.groupUrl}`, members, requestOptions);
  }
}
