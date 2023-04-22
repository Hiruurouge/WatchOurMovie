import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormGroup, FormControl, FormArray, FormBuilder } from '@angular/forms'
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-pref-form',
  templateUrl: './pref-form.component.html',
  styleUrls: ['./pref-form.component.scss']
})
export class PrefFormComponent {
  prefForm: FormGroup;

  clicked: boolean = false;

  data: string = "";

  constructor(private fb:FormBuilder, private http: HttpClient, private auth: AuthService) {
    this.prefForm = this.fb.group({
      genres: this.fb.array([
        this.fb.control('')
      ]),
      realisateurs: this.fb.array([
        this.fb.control('')
      ]),
      maisons_de_production: this.fb.array([
        this.fb.control('')
      ]),
    });
  }

  get genres() : FormArray {
    return this.prefForm.get("genres") as FormArray
  }

  addGenre() {
    this.genres.push(this.fb.control(''));
  }

  removeGenre(i:number) {
    console.log(i);
    this.genres.removeAt(i);
  }

  get realisateurs() : FormArray {
    return this.prefForm.get("realisateurs") as FormArray
  }

  addRealisateur() {
    this.realisateurs.push(this.fb.control(''));
  }

  removeRealisateur(i:number) {
    this.realisateurs.removeAt(i);
  }

  get maisons_de_production() : FormArray {
    return this.prefForm.get("maisons_de_production") as FormArray
  }

  addMaisonDeProduction() {
    this.maisons_de_production.push(this.fb.control(''));
  }

  removeMaisonDeProduction(i:number) {
    this.maisons_de_production.removeAt(i);
  }

  async onSubmit() {
    const headerDict = {
      'Accept': '*/*',
      'Authorization': 'Bearer ' + this.auth.getAccessToken()
    }
    
    const requestOptions = {                                                                                                                                                                                 
      headers: new HttpHeaders(headerDict), 
    };
    
    await this.http.get<HttpResponse<string>>("http://localhost:3212/api/ia/", requestOptions)
    .subscribe((rep) => {
      this.data = JSON.stringify(rep);
    })
  }

  itemIdentity(index: number, item: Object) {
    return index;
  }
}
