import {ChangeDetectorRef, Component, OnInit} from '@angular/core';
import { GroupService } from './../../services/group.service';
import {GroupI, UserI} from "../../interface/wom";
import {UserService} from "../../services/user.service";
import {group} from "@angular/animations";

@Component({
  selector: 'app-group',
  templateUrl: './group.component.html',
  styleUrls: ['./group.component.scss']
})
export class GroupComponent implements OnInit {

  userGroups: any[] = [];
  members:any[]=[]
  selectedGroup : GroupI = <GroupI>{}
  isEditModalOpen:boolean=false
  isMembersModalOpen:boolean=false
  newGroupName: string = '';
  newGroupErrorMessage: string = '';
  currentUser: UserI = <UserI>{};
  newUserMail: any = {};


  constructor(private groupService: GroupService, private userService:UserService, private changeDetectorRef: ChangeDetectorRef) { }

  async ngOnInit(): Promise<void> {
    await this.userService.getUser()
    this.currentUser = this.userService.user
    console.log(this.currentUser)
    await this.groupService.getUserGroups().toPromise().then(
      (groups) => {
        this.userGroups = groups!;
      },
      (error: any) => {
        console.log('Error retrieving user groups:', error);
      }
    );
    this.userGroups.forEach(group => {
      this.newUserMail[group.group_name] = '';
    });
  }

  createGroup(): void {
    if (this.newGroupName.trim() === '') {
      this.newGroupErrorMessage = 'Group name is required.';
      return;
    }

    this.groupService.createGroup(this.newGroupName).subscribe(
      (group: any) => {
        this.userGroups.push(group);
        this.newGroupName = '';
        this.newGroupErrorMessage = '';
        this.groupService.getUserGroups().subscribe(
          (groups: any[]) => {
            this.userGroups = groups;
          },
          (error: any) => {
            console.log('Error retrieving user groups:', error);
          }
        );
        this.isModalOpen=false
      },
      (error: any) => {
        alert('Error creating group:'+ error);
        this.newGroupErrorMessage = 'Error creating group.';
      }
    );
  }

  deleteGroup(group: any): void {
    console.log(group)
    this.groupService.deleteGroup(group.uid).subscribe(
      () => {
        this.userGroups = this.userGroups.filter(g => g !== group);
      },
      (error: any) => {
        console.log('Error deleting group:', error);
      }
    );
  }

  updateGroup(): void {
    const updatedGroup = {
      owner: this.selectedGroup.owner,
      uid: this.selectedGroup.uid,
      group_name: this.newGroupName
    }
    this.groupService.updateGroup(updatedGroup).subscribe(
      () => {
        console.log('Group updated successfully.');
        this.groupService.getUserGroups().subscribe(
          (groups: any[]) => {
            this.userGroups = groups;
          },
          (error: any) => {
            console.log('Error retrieving user groups:', error);
          }
        );
      },
      (error: any) => {
        console.log('Error updating group:', error);
      }
    );
    this.closeEditModal()
  }

  // Définir une variable pour suivre l'état de la fenêtre modale
  isModalOpen = false;

// Fonction pour ouvrir la fenêtre modale
  openModal() {
    this.isModalOpen = true;
  }
  openEditModal(group: any) {
    this.isEditModalOpen = true;
    this.selectedGroup = group
  }
  closeEditModal() {
    this.isEditModalOpen = false;
  }

// Fonction pour fermer la fenêtre modale
  closeModal() {
    this.isModalOpen = false;
  }

// Fonction pour empêcher la propagation de l'événement lorsqu'on clique à l'intérieur de la fenêtre modale
  stopPropagation(event: MouseEvent) {
    event.stopPropagation();
  }
getGroupMembers(group: any)
{
  console.log(group)
  this.groupService.getGroupMembers(group).subscribe((res)=>{
    this.members=res
    this.selectedGroup=group
    this.isMembersModalOpen = true
  })
}
  closeMembersModal()
    {
      this.isMembersModalOpen =false
    }
  async addGroupMember(group:any,mail:any)
  {
      let userId
      await this.userService.getUserByMail(mail).toPromise().then((res)=>{
        userId=res
        this.groupService.addUser(group,userId).toPromise().then(()=> console.log("done"))
      })
  }
}
