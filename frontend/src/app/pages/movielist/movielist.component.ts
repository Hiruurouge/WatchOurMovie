import { Component, OnInit } from '@angular/core';
import {VisualizeService} from "../../services/visualize.service";
import { MovieI } from "../../interface/wom";

@Component({
  selector: 'app-movie-list',
  templateUrl: './movielist.component.html',
  styleUrls: ['./movielist.component.scss']
})
export class MovieListComponent implements OnInit {

  movies: MovieI[] = [];
  filteredMovies: MovieI[] = [];
  watched:boolean=false;
  displayList: MovieI[] = [];
  search: string = "";

  constructor(private visualizeService: VisualizeService) { }

  ngOnInit(): void {
    this.visualizeService.getMoviesSeenByUser().subscribe(moviesSeen => {
      this.displayList = moviesSeen
    });
    this.visualizeService.getRandMovies().subscribe(movies => {
      this.movies = movies;
      this.filterMovies()
    });
  }

  filterMovies(): void {
    this.visualizeService.getMoviesSeenByUser().subscribe((moviesSeen:MovieI[]) => {
      this.filteredMovies = this.movies.filter(movie => !(moviesSeen.map(sMovie => sMovie.uid == movie.uid).reduce((prev, current) => prev || current, false)));
      this.displayList= this.filteredMovies
    });
  }

  markAsSeen(movieUid: number): void {
    this.visualizeService.createVisualizeRelationships(movieUid).subscribe(response => {
      this.filterMovies();
    });
  }

  onListChange(){
    if (this.watched) {
      this.visualizeService.getMoviesSeenByUser().subscribe(moviesSeen => {
          this.displayList = moviesSeen
          this.watched=!this.watched
        });
    } else {
      this.displayList = this.filteredMovies
      this.watched=!this.watched
    }
  }

  onClickSearch() {
    if (this.search != "") {
      this.visualizeService.getMovieByTitle(this.search).subscribe(movie =>
        this.displayList = [movie]
      );
    }
  }
}
