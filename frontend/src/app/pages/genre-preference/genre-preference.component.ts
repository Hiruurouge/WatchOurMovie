import { Component, OnInit,OnChanges } from '@angular/core';
import { GenreI,StaffI,ProdI,MovieDataI } from '../../interface/wom';
import { GenrePreferenceService } from '../../services/genre-preference.service';
import {StaffService} from "../../services/staff.service";
import {ProductionService} from "../../services/production.service";
import {PredictionService} from "../../services/prediction.service";

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
  staffList:any=[]
  isMovieModalOpen:boolean=false
  prodlist: any = []
  movies: any =[]
  genres: GenreI[]=Array(<GenreI>{})
  staffs: StaffI[]=Array(<StaffI>{})
  prods:ProdI[]=Array(<ProdI>{})
  newGenre: GenreI =  <GenreI>{};
  showProductionModal = false;
  showStaffModal = false;
  selectedStaff: StaffI= <StaffI>{}
  selectedProd: ProdI = <ProdI>{}
  newStaff:StaffI=<StaffI>{}
   newProd: ProdI=<ProdI>{};

  constructor(private genrePreferenceService: GenrePreferenceService, private staffService:StaffService,private prodService:ProductionService, private recService:PredictionService) {

  }

  async ngOnInit() {
    this.genrePreferenceService.getGenrePreferences().subscribe((res: any) => {
      this.genres = res;
    });
    this.genrePreferenceService.getProductionPreferences().subscribe((res)=>{
      this.prods = res;
    })
    this.genrePreferenceService.getStaffPreferences().subscribe((res)=>{
      this.staffs = res;
    })
    await this.staffService.getAllStaff().toPromise().then((res)=> this.staffList=res)
    await this.prodService.getAllProd().toPromise().then((res)=>this.prodlist=res)
    console.log(this.genres,this.staffs,this.prods)
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
  this.newGenre = selectedGenre as GenreI;
  }
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
  openStaffModal(){
    this.showStaffModal = true
  }
  closeStaffModal(){
    this.showStaffModal =false
  }

  openProdModal(){
    this.showProductionModal = true
  }
  closeProdModal(){
    this.showProductionModal =false
  }
// Fonction pour empêcher la propagation de l'événement lorsqu'on clique à l'intérieur de la fenêtre modale
  stopPropagation(event: MouseEvent) {
    event.stopPropagation();
  }
  addStaffPreference(){
    this.genrePreferenceService.addStaffPreference([this.newStaff]).subscribe((res: any) => {
      this.showStaffModal = false
      this.genrePreferenceService.getStaffPreferences().subscribe((res: any) => {
        this.staffs = res;
        console.log(this.staffs)
      });
    });  }
  onStaff(event:any){
    const selectedStaffName = event.target.value;
    this.selectedStaff = this.staffList.find((staff: { name: any; }) => staff.name === selectedStaffName);
    this.newStaff = this.selectedStaff
    console.log(this.newStaff)
  }
  addProdPreference(){
    this.genrePreferenceService.addProductionPreference([this.newProd]).subscribe((res: any) => {
      this.showProductionModal = false
      this.genrePreferenceService.getProductionPreferences().subscribe((res: any) => {
        this.prods = res;
        console.log(this.prods)
      });
    });  }
  onProd(event:any){
    const prodName = event.target.value;
    this.selectedProd = this.prodlist.find((prod: { name: any; }) => prod.name === prodName);
    this.newProd = this.selectedProd
    console.log(this.newProd)
  }
  reco(){
    const obj:MovieDataI = {
      genres: [],
      staffs: [],
      productions: []
    };
    // Ajouter les genres
    for (const genre of this.genres) {
      obj.genres.push({
        uid: obj.genres.length,
        name: genre.name
      });
    }

// Ajouter les staffs
    for (const staff of this.staffs) {
      obj.staffs.push({
        uid: obj.staffs.length,
        name: staff.name,
        job: staff.job
      });
    }

// Ajouter les productions
    for (const prod of this.prods) {
      obj.productions.push({
        uid: obj.productions.length,
        name: prod.name
      });
    }
    console.log(obj)
    this.recService.getRecommendation(obj).toPromise().then((res)=> {
      this.movies = res
      console.log(this.movies[0])
    })
  }
  openMovieModal()
  {
    this.reco()
    this.isMovieModalOpen = true;
  }
  closeMovieModal()
  {
    this.isMovieModalOpen = false
  }

}
