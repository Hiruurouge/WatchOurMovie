import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PrefFormComponent } from './pref-form/pref-form.component';
import {LoginComponent} from "./pages/login/login.component";
import {RegisterComponent} from "./pages/register/register.component";
import {GroupComponent} from "./pages/group/group.component";
import {UserProfileUpdateComponent} from "./pages/user-profile-update/user-profile-update.component";
import {UserProfileComponent} from "./pages/user-profile/user-profile.component";
import {GenrePreferenceComponent} from "./pages/genre-preference/genre-preference.component";

const routes: Routes = [
  { path: '', component:PrefFormComponent},
  {path:'login',component:LoginComponent},
  {path:'register',component:RegisterComponent},
  {path:'group',component:GroupComponent},
  {path:'updateUser',component:UserProfileUpdateComponent},
  {path:'profile',component:UserProfileComponent},
  {path:'pref',component:GenrePreferenceComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
