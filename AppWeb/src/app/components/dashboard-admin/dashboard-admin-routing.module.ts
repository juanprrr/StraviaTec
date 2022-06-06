import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardAdminComponent } from './dashboard-admin.component';
import { GestionCarreraComponent } from './gestion-carrera/gestion-carrera.component';
import { GestionGruposComponent } from './gestion-grupos/gestion-grupos.component';
import { GestionRetosComponent } from './gestion-retos/gestion-retos.component';
import { InscripcionesComponent } from './inscripciones/inscripciones.component';
import { ReportesParticipantesComponent } from './reportes-participantes/reportes-participantes.component';
import { ReportesPosicionesComponent } from './reportes-posiciones/reportes-posiciones.component';


const routes: Routes = [
    { path: '', component: DashboardAdminComponent, children: [
      { path: 'carreras', component: GestionCarreraComponent },
      { path: 'grupos', component: GestionGruposComponent },
      { path: 'retos', component: GestionRetosComponent },
      { path: 'inscripciones', component: InscripcionesComponent },
      { path: 'reportes-participantes', component: ReportesParticipantesComponent },
      { path: 'reportes-posiciones', component: ReportesPosicionesComponent }
    ]  
  },
    
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardAdminRoutingModule { }
