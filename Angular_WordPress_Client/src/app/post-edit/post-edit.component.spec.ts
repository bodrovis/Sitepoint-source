import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PostEditComponent } from './post-edit.component';

describe('PostEditComponent', () => {
  let component: PostEditComponent;
  let fixture: ComponentFixture<PostEditComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PostEditComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PostEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
