import { Component } from '@angular/core';
import {OnInit} from "@angular/core";
import {UserService} from "../../services/user.service";
import {GenreI, ProdI, StaffI, UserI} from "../../interface/wom";
import {Router} from "@angular/router";
import {GenrePreferenceService} from "../../services/genre-preference.service";
import {StaffService} from "../../services/staff.service";
import {ProductionService} from "../../services/production.service";
import {PredictionService} from "../../services/prediction.service";
import { GenreService } from 'src/app/services/genre.service';

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.scss']
})
export class UserProfileComponent implements  OnInit{
  user: UserI=<UserI>{}
  url:string=''
  genres: GenreI[]=Array(<GenreI>{})
  staffs: StaffI[]=Array(<StaffI>{})
  prods:ProdI[]=Array(<ProdI>{})
  newGenre: GenreI =  <GenreI>{};
  newStaff:StaffI=<StaffI>{}
  newProd: ProdI=<ProdI>{};
  staffList:any=[];
  prodlist: any = []
  genresList:any = [];
  constructor(private userService: UserService,private router: Router,private genrePreferenceService: GenrePreferenceService, private staffService:StaffService,private prodService:ProductionService, private genreService:  GenreService) { }

  addGenrePreference() {
    console.log(this.newGenre)
    this.genrePreferenceService.addGenrePreference([this.newGenre]).subscribe((res: any) => {
      this.genrePreferenceService.getGenrePreferences().subscribe((res: any) => {
        this.genres = res;
      });
    });
  }
  addProductionPreference() {
    console.log(this.newProd)
    this.genrePreferenceService.addProductionPreference([this.newProd]).subscribe((res: any) => {
      this.genrePreferenceService.getProductionPreferences().subscribe((res: any) => {
        this.prods = res;
      });
    });
  }
  addStaffPreference() {
    console.log(this.newStaff)
    this.genrePreferenceService.addStaffPreference([this.newStaff]).subscribe((res: any) => {
      this.genrePreferenceService.getStaffPreferences().subscribe((res: any) => {
        this.staffs = res;
      });
    });
  }
  deleteGenrePreference(genre: GenreI) {
    this.genrePreferenceService.deleteGenrePreference(genre).subscribe((res: any) => {
      this.genrePreferenceService.getGenrePreferences().subscribe((res: any) => {
        this.genres = res;
      });
    });
  }
  deleteProductionPreference(production: ProdI) {
    this.genrePreferenceService.deleteProductionPreference(production).subscribe((res: any) => {
      this.genrePreferenceService.getProductionPreferences().subscribe((res: any) => {
        this.prods = res;
      });
    });
  }
  deleteStaffPreference(staff: StaffI) {
    this.genrePreferenceService.deleteStaffPreference(staff).subscribe((res: any) => {
      this.genrePreferenceService.getStaffPreferences().subscribe((res: any) => {
        this.staffs = res;
      });
    });
  }

  async ngOnInit(){
    await this.userService.getUser().then(() => {
      this.user = this.userService.user;
    });
    this.url='https://robohash.org/'+this.user.last_name+'.png'
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
    console.log(this.genres,this.staffs,this.prods)
  }
  updateUser() {
    this.userService.updateUser(this.user).subscribe();
  }
  deleteUser(){
    this.userService.deleteUser()
    this.router.navigateByUrl("/login")
  }
}
