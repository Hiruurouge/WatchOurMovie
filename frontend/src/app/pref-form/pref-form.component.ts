import { HttpClient, HttpResponse } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormGroup, FormControl, FormArray, FormBuilder } from '@angular/forms'

@Component({
  selector: 'app-pref-form',
  templateUrl: './pref-form.component.html',
  styleUrls: ['./pref-form.component.scss']
})
export class PrefFormComponent {
  prefForm: FormGroup;

  data: string = "";

  constructor(private fb:FormBuilder, private http: HttpClient) {
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
    console.log(this.prefForm.value);
    await this.http.get<HttpResponse<string>>("http://localhost:3212/api/ia/")
    .subscribe((rep) => {
      this.data = JSON.stringify(rep);
    })
  }

  itemIdentity(index: number, item: Object) {
    return index;
  }
}
