import { Component, OnInit } from '@angular/core';
import { Actividad } from 'src/app/Models/actividad';
import { Usuario } from 'src/app/Models/usuario';
import { ActividadService } from 'src/app/Services/actividad.service';
import { UsuarioSigueUsuarioService } from 'src/app/Services/usuario-sigue-usuario.service';
import { UsuarioService } from 'src/app/Services/usuario.service';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent implements OnInit {
  currentUser:Usuario = new Usuario
  listActivities:Actividad[] = []
  listFollowedUsers: Usuario[] = []

  constructor(private userService:UsuarioService, private activityService:ActividadService, private followUserService:UsuarioSigueUsuarioService) { }

  ngOnInit(): void {
    this.loadCurrentUser();
    this.userService.getUsers().subscribe((res: any)=>{
      this.getFollowedUsersActivities(res)
    })
  }

  loadCurrentUser() {
    this.currentUser = this.userService.getCurrentUser()
  }

  getFollowedUsersActivities(allUsers:any) {
    this.followUserService.getUsuarioSigueUsuarios().subscribe((res: any)=>{
      for (var i=0; i<res.length; i++){
        if (res[i].id_user == this.currentUser.usuario) {
          for (var j=0; j<allUsers.length; j++){
            if (res[i].user_sigue == allUsers[j].usuario){
              this.listFollowedUsers.push(allUsers[j])
            }
          }
        }
      }
      this.activityService.getActivities().subscribe((res: any)=>{
        for (var i=0; i<this.listFollowedUsers.length; i++){
          for (var j=0; j<res.length; j++){
            if (res[j].id_usuario == this.listFollowedUsers[i].usuario) {
              this.listActivities.push(res[j])
            }
          }
        }
        this.listActivities.sort(function(a:any, b:any) {
          if (a.id < b.id){
            return 1
          } else if(a.id > b.id){
            return -1
          }else{
            return 0
          }
        })
      })
    })
  }
}
