import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavbarComponent } from './navbar/navbar.component';
import { RegistroCarreraComponent } from './registro-carrera/registro-carrera.component';
import { GestionCarreraComponent } from './gestion-carrera/gestion-carrera.component';
import { GestionRetosComponent } from './gestion-retos/gestion-retos.component';
import { GestionGruposComponent } from './gestion-grupos/gestion-grupos.component';
import { ReportesParticipantesComponent } from './reportes-participantes/reportes-participantes.component';
import { ReportesPosicionesComponent } from './reportes-posiciones/reportes-posiciones.component';
import { InscripcionesComponent } from './inscripciones/inscripciones.component';



@NgModule({
  declarations: [
    NavbarComponent,
    RegistroCarreraComponent,
    GestionCarreraComponent,
    GestionRetosComponent,
    GestionGruposComponent,
    ReportesParticipantesComponent,
    ReportesPosicionesComponent,
    InscripcionesComponent
  ],
  imports: [
    CommonModule
  ]
})
export class DashboardAdminModule { }
