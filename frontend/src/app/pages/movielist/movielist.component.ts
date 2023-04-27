import { Component, OnInit } from '@angular/core';
import {VisualizeService} from "../../services/visualize.service";

@Component({
  selector: 'app-movie-list',
  templateUrl: './movielist.component.html',
  styleUrls: ['./movielist.component.scss']
})
export class MovieListComponent implements OnInit {

  movies: any[] = [];
  filteredMovies: any[] = [];

  constructor(private visualizeService: VisualizeService) { }

  ngOnInit(): void {
    this.visualizeService.getAllMovies().subscribe(movies => {
      this.movies = movies;
      this.filterMovies();
    });
  }

  filterMovies(): void {
    this.visualizeService.getMoviesSeenByUser().subscribe(moviesSeen => {
      this.filteredMovies = this.movies.filter(movie => !moviesSeen.includes(movie.uid));
    });
  }


  onMovieClick(movie: any): void {
    this.visualizeService.createVisualizeRelationships(movie.uid).subscribe(() => {
      this.filterMovies(); // Actualisation de la liste de films après la création de la relation visualize
    });
  }

  movieSeen(movie: any): boolean {
    let moviesSeen: number[] = [];
    this.visualizeService.getMoviesSeenByUser().subscribe(movies => {
      moviesSeen = movies.map((movie: { uid: any; }) => movie.uid);
    });
    return moviesSeen.includes(movie.uid);
  }
}
