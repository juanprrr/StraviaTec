import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './dashboard.component';
import { InicioComponent } from './inicio/inicio.component';
import { ChallengesComponent } from './challenges/challenges.component';
import { ExploreComponent } from './explore/explore.component';
import { TrainingComponent } from './training/training.component';
import { CrearActividadComponent } from './inicio/crear-actividad/crear-actividad.component';
import { FriendsComponent } from './training/friends/friends.component';

const routes: Routes = [
    { path: '', component: DashboardComponent, children: [
      { path: '', component: InicioComponent },
      { path: 'challenges', component: ChallengesComponent },
      { path: 'explore', component: ExploreComponent},
      { path: 'training', component: TrainingComponent},
      { path: 'crear-actividad', component: CrearActividadComponent},
      { path: 'friends', component: FriendsComponent}
    ]  
  },
    
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DashboardRoutingModule { }
