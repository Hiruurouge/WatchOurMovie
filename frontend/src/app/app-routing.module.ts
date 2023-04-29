import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PrefFormComponent } from './pages/pref-form/pref-form.component';
import {LoginComponent} from "./pages/login/login.component";
import {GroupComponent} from "./pages/group/group.component";
import {UserProfileComponent} from "./pages/user-profile/user-profile.component";

import {AuthGuard} from "./guard/auth.guard";
import {MovieListComponent} from "./pages/movielist/movielist.component";

const routes: Routes = [
  {path: '', component:LoginComponent},
  {path:'like',component:PrefFormComponent, canActivate:[AuthGuard]},
  {path:'group',component:GroupComponent, canActivate:[AuthGuard]},
  {path:'profile',component:UserProfileComponent,canActivate:[AuthGuard]},
  {path:'visu',component:MovieListComponent,canActivate:[AuthGuard]}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
