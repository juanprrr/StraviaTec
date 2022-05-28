import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavbarComponent } from './navbar/navbar.component';
import { GestionCarreraComponent } from './gestion-carrera/gestion-carrera.component';
import { GestionRetosComponent } from './gestion-retos/gestion-retos.component';
import { GestionGruposComponent } from './gestion-grupos/gestion-grupos.component';
import { ReportesParticipantesComponent } from './reportes-participantes/reportes-participantes.component';
import { ReportesPosicionesComponent } from './reportes-posiciones/reportes-posiciones.component';
import { InscripcionesComponent } from './inscripciones/inscripciones.component';
import { SharedModule } from '../shared/shared.module';
import { DashboardAdminComponent } from './dashboard-admin.component';
import { DashboardAdminRoutingModule } from './dashboard-admin-routing.module';



@NgModule({
  declarations: [
    DashboardAdminComponent,
    NavbarComponent,
    GestionCarreraComponent,
    GestionRetosComponent,
    GestionGruposComponent,
    ReportesParticipantesComponent,
    ReportesPosicionesComponent,
    InscripcionesComponent
  ],
  imports: [
    CommonModule,
    DashboardAdminRoutingModule,
    SharedModule
  ]

  

})
export class DashboardAdminModule { }
