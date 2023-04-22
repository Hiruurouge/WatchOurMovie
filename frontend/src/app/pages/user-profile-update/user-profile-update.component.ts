import { Component, OnInit } from '@angular/core';
import { UserService } from '../../services/user.service';
import {UserI} from "../../interface/wom";

@Component({
  selector: 'app-user-profile-update',
  templateUrl: './user-profile-update.component.html',
  styleUrls: ['./user-profile-update.component.scss']
})
export class UserProfileUpdateComponent implements OnInit {
  user: UserI = <UserI>{};

  constructor(private userService: UserService) { }

  async ngOnInit(){
    await this.userService.getUser().then(() => {
      this.user = this.userService.user;
    });
  }

  updateUser() {
    this.userService.updateUser(this.user).subscribe();
  }
}
