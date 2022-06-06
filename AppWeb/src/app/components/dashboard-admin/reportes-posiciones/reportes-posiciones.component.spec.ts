import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReportesPosicionesComponent } from './reportes-posiciones.component';

describe('ReportesPosicionesComponent', () => {
  let component: ReportesPosicionesComponent;
  let fixture: ComponentFixture<ReportesPosicionesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ReportesPosicionesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ReportesPosicionesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
