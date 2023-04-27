import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PrefFormComponent } from './pref-form/pref-form.component';
import { MenuComponent } from './menu/menu.component';
import { FooterComponent } from './footer/footer.component';
import { LoginComponent } from './pages/login/login.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RegisterComponent } from './pages/register/register.component';
import { GroupComponent } from './pages/group/group.component';
import {HTTP_INTERCEPTORS } from '@angular/common/http';
import { UserProfileUpdateComponent } from './pages/user-profile-update/user-profile-update.component';
import {UserProfileComponent} from "./pages/user-profile/user-profile.component";
import { NavbarComponent } from './pages/navbar/navbar.component';
import { GenrePreferenceComponent } from './pages/genre-preference/genre-preference.component';
import { ModalComponent } from './pages/modal/modal.component';
import {RouterModule, Routes} from "@angular/router";
import { MovieListComponent } from './pages/movielist/movielist.component';
//import { TokenInterceptor } from '././services/group.service';

let routes: Routes;

@NgModule({
  declarations: [
    AppComponent,
    PrefFormComponent,
    MenuComponent,
    FooterComponent,
    LoginComponent,
    RegisterComponent,
    GroupComponent,
    UserProfileUpdateComponent,
    UserProfileComponent,
    NavbarComponent,
    GenrePreferenceComponent,
    ModalComponent,
    MovieListComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    AppRoutingModule,
  ],
  providers: [
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
