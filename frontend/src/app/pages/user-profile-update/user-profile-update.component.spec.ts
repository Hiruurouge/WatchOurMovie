import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserProfileUpdateComponent } from './user-profile-update.component';

describe('UserProfileComponent', () => {
  let component: UserProfileUpdateComponent;
  let fixture: ComponentFixture<UserProfileUpdateComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserProfileUpdateComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UserProfileUpdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
