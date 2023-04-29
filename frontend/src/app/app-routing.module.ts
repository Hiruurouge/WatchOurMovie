import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PrefFormComponent } from './pref-form/pref-form.component';
import {LoginComponent} from "./pages/login/login.component";
import {GroupComponent} from "./pages/group/group.component";
import {UserProfileComponent} from "./pages/user-profile/user-profile.component";
import {GenrePreferenceComponent} from "./pages/genre-preference/genre-preference.component";
import {AuthGuard} from "./guard/auth.guard";
import {MovieListComponent} from "./pages/movielist/movielist.component";

const routes: Routes = [
  {path: '', component:LoginComponent},
  {path:'like',component:PrefFormComponent},
  {path:'group',component:GroupComponent},
  {path:'profile',component:UserProfileComponent},
  {path:'pref',component:GenrePreferenceComponent},
  {path:'visu',component:MovieListComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
