import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GenrePreferenceComponent } from './genre-preference.component';

describe('GenrePreferenceComponent', () => {
  let component: GenrePreferenceComponent;
  let fixture: ComponentFixture<GenrePreferenceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GenrePreferenceComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GenrePreferenceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
