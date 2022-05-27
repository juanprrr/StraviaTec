import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DashboardRoutingModule } from './dashboard-routing.module';
import { DashboardComponent } from './dashboard.component';
import { InicioComponent } from './inicio/inicio.component';
import { NavbarComponent } from './navbar/navbar.component';
import { SharedModule } from '../shared/shared.module';
import { ChallengesComponent } from './challenges/challenges.component';
import { ExploreComponent } from './explore/explore.component';
import { TrainingComponent } from './training/training.component';
import { CrearActividadComponent } from './inicio/crear-actividad/crear-actividad.component';



@NgModule({
  declarations: [
    DashboardComponent,
    InicioComponent,
    NavbarComponent,
    ChallengesComponent,
    ExploreComponent,
    TrainingComponent,
    CrearActividadComponent
  ],
  imports: [
    CommonModule,
    DashboardRoutingModule,
    SharedModule
  ]
})
export class DashboardModule { }
