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
  lists: string[] = ["What you watched","Tell us what you watched"]
  selectedList:string = this.lists[0]
  displayList: any
  constructor(private visualizeService: VisualizeService) { }

  ngOnInit(): void {
    this.visualizeService.getMoviesSeenByUser().subscribe(moviesSeen => {
      this.displayList = moviesSeen
      console.log(moviesSeen)
    });
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

  markAsSeen(movieUid: number): void {
    this.visualizeService.createVisualizeRelationships(movieUid).subscribe(response => {
      this.visualizeService.getMoviesSeenByUser().subscribe(moviesSeen => {
        console.log(moviesSeen)
        this.filteredMovies = this.movies.filter(movie => !moviesSeen.includes(movie.uid));
      });
    });
  }
  onListChange(){
    if (this.selectedList == this.lists[0]) {
      this.visualizeService.getMoviesSeenByUser().subscribe(moviesSeen => {
          this.displayList = moviesSeen
          console.log(moviesSeen)
        });
    } else {
      this.displayList = this.filteredMovies
    }
  }
}
