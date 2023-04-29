import { Component, OnInit,OnChanges } from '@angular/core';
import { GenreI,StaffI,ProdI,MovieDataI } from '../../interface/wom';
import { GenrePreferenceService } from '../../services/genre-preference.service';
import {StaffService} from "../../services/staff.service";
import {ProductionService} from "../../services/production.service";
import {PredictionService} from "../../services/prediction.service";
import { GenreService } from 'src/app/services/genre.service';

@Component({
  selector: 'app-genre-preference',
  templateUrl: './genre-preference.component.html',
  styleUrls: ['./genre-preference.component.scss']
})
export class GenrePreferenceComponent implements OnInit {
  genresList: any = []
  staffList:any=[]
  prodlist: any = []
  genres: GenreI[]=Array(<GenreI>{})
  staffs: StaffI[]=Array(<StaffI>{})
  prods:ProdI[]=Array(<ProdI>{})
  newGenre: GenreI =  <GenreI>{};
  showProductionModal = false;
  showStaffModal = false;
  selectedGenre: GenreI= <GenreI>{}
  selectedStaff: StaffI= <StaffI>{}
  selectedProd: ProdI = <ProdI>{}
  newStaff:StaffI=<StaffI>{}
  newProd: ProdI=<ProdI>{};

  constructor(private genrePreferenceService: GenrePreferenceService, private staffService:StaffService,private prodService:ProductionService, private genreService:GenreService) {

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
    await this.genreService.getAllProd().toPromise().then((res)=>this.genresList=res)
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
    this.selectedGenre = this.genresList.find((genre: { name: any; } ) => genre.name === selectedGenreName);
    this.newGenre = this.selectedGenre;

  }

  deleteGenrePreference(genre: GenreI) {
    this.genrePreferenceService.deleteGenrePreference(genre).subscribe((res: any) => {
      this.genrePreferenceService.getGenrePreferences().subscribe((res: any) => {
        this.genres = res;
      });
    });
  }

  deleteStaffPreference(staff:StaffI)
  {
    this.genrePreferenceService.deleteStaffPreference(staff).subscribe((res: any) => {
      this.genrePreferenceService.getStaffPreferences().subscribe((res: any) => {
        this.staffs = res;
      });
    });  
  }

  deleteProdPreferences(prod:ProdI)
  {
    this.genrePreferenceService.deleteProductionPreference(prod).subscribe((res: any) => {
      this.genrePreferenceService.getProductionPreferences().subscribe((res: any) => {
        this.prods = res;
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
      });
    });  
  }

  onStaff(event:any){
    const selectedStaffName = event.target.value;
    this.selectedStaff = this.staffList.find((staff: { name: any; }) => staff.name === selectedStaffName);
    this.newStaff = this.selectedStaff
  }

  addProdPreference(){
    this.genrePreferenceService.addProductionPreference([this.newProd]).subscribe((res: any) => {
      this.showProductionModal = false
      this.genrePreferenceService.getProductionPreferences().subscribe((res: any) => {
        this.prods = res;
      });
    });  
  }

  onProd(event:any){
    const prodName = event.target.value;
    this.selectedProd = this.prodlist.find((prod: { name: any; }) => prod.name === prodName);
    this.newProd = this.selectedProd
  }

}
