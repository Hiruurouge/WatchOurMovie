import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PrefFormComponent } from './pref-form/pref-form.component';

const routes: Routes = [
  { path: '', component:PrefFormComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
