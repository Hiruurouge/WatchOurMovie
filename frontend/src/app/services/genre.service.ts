import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AuthService } from './auth.service';
import { UserService } from './user.service';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class GenreService {

  apiUrl: string = 'http://localhost:3212/api/genre';
  token: string = '';
  constructor(private http: HttpClient, private authService: AuthService, private userService:UserService) {
    this.token = authService.getAccessToken()!
  }

  getAllProd(): Observable<any[]> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
    return this.http.get<any[]>(`${this.apiUrl}/all`,{headers});
  }
}
