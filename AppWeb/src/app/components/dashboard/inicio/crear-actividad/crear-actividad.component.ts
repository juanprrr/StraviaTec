import { Component, OnInit } from '@angular/core';
import { Actividad } from 'src/app/Models/actividad';
import { Usuario } from 'src/app/Models/usuario';
import { ActividadService } from 'src/app/Services/actividad.service';
import { UsuarioService } from 'src/app/Services/usuario.service';

@Component({
  selector: 'app-crear-actividad',
  templateUrl: './crear-actividad.component.html',
  styleUrls: ['./crear-actividad.component.css']
})
export class CrearActividadComponent implements OnInit {
  activities: any[] = [
    {value: 'Correr', viewValue: 'Correr'},
    {value: 'Natación', viewValue: 'Natación'},
    {value: 'Ciclismo', viewValue: 'Ciclismo'},
    {value: 'Senderismo', viewValue: 'Senderismo'},
    {value: 'Kayak', viewValue: 'Kayak'},
    {value: 'Caminata', viewValue: 'Caminata'}
  ];
  newActivity:Actividad = new Actividad
  currentUser:Usuario = new Usuario
  listActivities:Actividad [] = []

  constructor(private activityService:ActividadService, private userService:UsuarioService) { }

  ngOnInit(): void {
    this.loadCurrentUser();
    this.activityService.getActivities().subscribe((res: any)=>{
      this.listActivities = res
    })
  }

  addActivity(newAct:Actividad){
    newAct.id = this.listActivities.length + 1
    newAct.id_usuario = this.currentUser.usuario
    newAct.id_reto = undefined
    newAct.recorrido = undefined

    console.log(newAct, "Nueva actividad")
    
    this.activityService.insertActivity(newAct).subscribe(()=>{
      window.location.reload()
      alert("La actividad se posteó exitosamente!")
    },()=>alert("No se pudo postear la actividad, por favor intente de nuevo!"))
  }

  loadCurrentUser() {
    this.currentUser = this.userService.getCurrentUser()
  }
}
