import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import {MovieI} from "../interface/wom";
import {AuthService} from "./auth.service";

@Injectable({
  providedIn: 'root'
})
export class VisualizeService {

  private apiUrl = `http://localhost:3212/api/watch`;
  private movieUrl = `http://localhost:3212/api/movie`
  private token = ''

  constructor(private http: HttpClient,private authService:AuthService) {
    this.token = this.authService.getAccessToken()!
  }

  private getHeaders() {
    return new HttpHeaders({
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json'
    });
  }

  getAllMovies():Observable<any>{
    return this.http.get<any>(`${this.movieUrl}/all`, { headers: this.getHeaders() });
  }

  getMovieByTitle(title:string):Observable<any>{
    return this.http.get<any>(`${this.movieUrl}/title`, { headers: this.getHeaders(), params: {"title": title}});
  }

  getRandMovies():Observable<any>{
    return this.http.get<any>(`${this.movieUrl}/random`, { headers: this.getHeaders() });
  }

  getMoviesSeenByUser(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/all`, { headers: this.getHeaders() });
  }

  createVisualizeRelationships(movie:number): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}`, [{"uid":movie}], { headers: this.getHeaders() });
  }

  deleteVisualizeRelationship(movie: number): Observable<any> {
    return this.http.delete<any>(`${this.apiUrl}`, { headers: this.getHeaders(), body: {"uid":movie} });
  }
}
