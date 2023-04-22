import { Component } from '@angular/core';
import {OnInit} from "@angular/core";
import {UserService} from "../../services/user.service";
import {UserProfileUpdateComponent} from "../user-profile-update/user-profile-update.component";
import {UserI} from "../../interface/wom";

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.scss']
})
export class UserProfileComponent implements  OnInit{
  user: UserI=<UserI>{}
  url:string=''
  constructor(private userService: UserService) { }

  async ngOnInit(){
    await this.userService.getUser().then(() => {
      this.user = this.userService.user;
    });
    this.url='https://robohash.org/'+this.user.last_name+'.png'
  }
}
