import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PrefFormComponent } from './pages/pref-form/pref-form.component';
import { FooterComponent } from './pages/footer/footer.component';
import { LoginComponent } from './pages/login/login.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { GroupComponent } from './pages/group/group.component';
import {UserProfileComponent} from "./pages/user-profile/user-profile.component";
import { NavbarComponent } from './pages/navbar/navbar.component';
import { ModalComponent } from './pages/modal/modal.component';
import {RouterModule, Routes} from "@angular/router";
import { MovieListComponent } from './pages/movielist/movielist.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

let routes: Routes;

@NgModule({
  declarations: [
    AppComponent,
    PrefFormComponent,
    FooterComponent,
    LoginComponent,
    GroupComponent,
    UserProfileComponent,
    NavbarComponent,
    ModalComponent,
    MovieListComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    AppRoutingModule,
    BrowserAnimationsModule
  ],
  providers: [
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
