import { Component, OnInit,OnChanges } from '@angular/core';
import { GenreI } from '../../interface/wom';
import { GenrePreferenceService } from '../../services/genre-preference.service';

@Component({
  selector: 'app-genre-preference',
  templateUrl: './genre-preference.component.html',
  styleUrls: ['./genre-preference.component.scss']
})
export class GenrePreferenceComponent implements OnInit {
   genresList = [
    { uid: 12, name: 'Adventure' },
    { uid: 14, name: 'Fantasy' },
    { uid: 16, name: 'Animation' },
    { uid: 18, name: 'Drama' },
    { uid: 27, name: 'Horror' },
    { uid: 28, name: 'Action' },
    { uid: 35, name: 'Comedy' },
    { uid: 36, name: 'History' },
    { uid: 37, name: 'Western' },
    { uid: 53, name: 'Thriller' },
    { uid: 80, name: 'Crime' },
    { uid: 99, name: 'Documentary' },
    { uid: 878, name: 'Science Fiction' },
    { uid: 9648, name: 'Mystery' },
    { uid: 10402, name: 'Music' },
    { uid: 10749, name: 'Romance' },
    { uid: 10751, name: 'Family' },
    { uid: 10752, name: 'War' },
    { uid: 10770, name: 'TV Movie' }
  ];

  genres: GenreI[]=Array(<GenreI>{})

  newGenre: GenreI =  <GenreI>{};
  showModal = false;


  constructor(private genrePreferenceService: GenrePreferenceService) { }

  ngOnInit() {
    this.genrePreferenceService.getGenrePreferences().subscribe((res: any) => {
      this.genres = res;
    });
  }

  addGenrePreference() {
    console.log(this.newGenre)
    this.genrePreferenceService.addGenrePreference(this.newGenre).subscribe((res: any) => {
      this.isModalOpen = false
      this.genrePreferenceService.getGenrePreferences().subscribe((res: any) => {
        this.genres = res;
      });
    });
  }
onGenreSelect(event:any){
  const selectedGenreName = event.target.value;
  const selectedGenre = this.genresList.find(genre => genre.name === selectedGenreName);
  this.newGenre = selectedGenre as GenreI;}
  deleteGenrePreference(genre: GenreI) {
    this.genrePreferenceService.deleteGenrePreference(genre).subscribe((res: any) => {
      this.genrePreferenceService.getGenrePreferences().subscribe((res: any) => {
        this.genres = res;
      });
    });
  }
  isModalOpen = false;

// Fonction pour ouvrir la fenêtre modale
  openModal() {
    this.isModalOpen = true;
  }

// Fonction pour fermer la fenêtre modale
  closeModal() {
    this.isModalOpen = false;
  }

// Fonction pour empêcher la propagation de l'événement lorsqu'on clique à l'intérieur de la fenêtre modale
  stopPropagation(event: MouseEvent) {
    event.stopPropagation();
  }
}
