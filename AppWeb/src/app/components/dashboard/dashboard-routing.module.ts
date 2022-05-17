import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './dashboard.component';
import { InicioComponent } from './inicio/inicio.component';
import { UsuariosComponent } from './usuarios/usuarios.component';
import { ChallengesComponent } from './challenges/challenges.component';
import { ExploreComponent } from './explore/explore.component';

const routes: Routes = [
    { path: '', component: DashboardComponent, children: [
      { path: '', component: InicioComponent },
      { path: 'usuarios', component: UsuariosComponent },
      { path: 'challenges', component: ChallengesComponent },
      { path: 'explore', component: ExploreComponent}
    ]  
  },
    
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }
