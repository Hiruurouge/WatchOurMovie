import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormGroup, FormControl, FormArray, FormBuilder } from '@angular/forms'
import { AuthService } from '../../services/auth.service';
import {GenrePreferenceService} from "../../services/genre-preference.service";
import {GenreI} from "../../interface/wom";
import {GroupService} from "../../services/group.service";
import {PredictionService} from "../../services/prediction.service";

@Component({
  selector: 'app-pref-form',
  templateUrl: './pref-form.component.html',
  styleUrls: ['./pref-form.component.scss']
})
export class PrefFormComponent {
  recommendedMovies: any[] = []; // variable pour stocker les films recommandés
  selectedGroup: any
  groups: any[] = []
  constructor(private preferencesService: GenrePreferenceService,
              private groupService: GroupService,
              private predictionService: PredictionService) { }

  ngOnInit(): void {
    // récupérer les préférences de l'utilisateur et les films recommandés pour l'utilisateur
    this.preferencesService.getUserPreferences().subscribe(userPreferences => {
      this.predictionService.getRecommendation(userPreferences).subscribe(recommendedMovies => {
        this.recommendedMovies = recommendedMovies;
      });
    });
    this.groupService.getUserGroups().subscribe((res)=>this.groups=res)
  }
  async getUserRec(){
    await this.preferencesService.getUserPreferences().toPromise().then(userPreferences => {
      this.predictionService.getRecommendation(userPreferences).toPromise().then(recommendedMovies => {
        this.recommendedMovies = recommendedMovies;
        console.log(this.recommendedMovies)
      });
    });
  }
  // fonction pour récupérer les films recommandés pour un groupe d'utilisateurs en fonction de ses préférences
  getGroupRecommendations(uid: any): void {
    this.preferencesService.getGroupPreferences(uid).subscribe(groupPreferences => {
      this.predictionService.getRecommendation(groupPreferences,uid).subscribe(recommendedMovies => {
        this.recommendedMovies = recommendedMovies;
      });
    });
  }
  onGroupChange(){
    console.log(this.selectedGroup)
    this.getGroupRecommendations(this.selectedGroup)
  }


}
