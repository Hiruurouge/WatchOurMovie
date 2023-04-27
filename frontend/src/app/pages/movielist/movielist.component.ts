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
    this.visualizeService.getRandMovies().subscribe(movies => {
      this.movies = movies;
      this.filterMovies()
    });
  }

  filterMovies(): void {
    this.visualizeService.getMoviesSeenByUser().subscribe(moviesSeen => {
      this.filteredMovies = this.movies.filter(movie => !moviesSeen.includes(movie.uid));
    });
  }

}
