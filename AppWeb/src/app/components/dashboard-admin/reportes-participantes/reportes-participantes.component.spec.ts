import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportesParticipantesComponent } from './reportes-participantes.component';

describe('ReportesParticipantesComponent', () => {
  let component: ReportesParticipantesComponent;
  let fixture: ComponentFixture<ReportesParticipantesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReportesParticipantesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ReportesParticipantesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
