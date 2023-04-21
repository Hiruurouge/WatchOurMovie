import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PrefFormComponent } from './pref-form/pref-form.component';
import {LoginComponent} from "./pages/login/login.component";
import {RegisterComponent} from "./pages/register/register.component";

const routes: Routes = [
  { path: '', component:PrefFormComponent},
  {path:'login',component:LoginComponent},
  {path:'register',component:RegisterComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
