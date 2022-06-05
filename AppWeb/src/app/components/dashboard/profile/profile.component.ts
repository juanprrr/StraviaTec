import { Component, OnInit } from '@angular/core';
import { Usuario } from 'src/app/Models/usuario';
import { UsuarioService } from 'src/app/Services/usuario.service';
import * as moment from 'moment';
import { MatDialog } from '@angular/material/dialog';
import { ActividadService } from 'src/app/Services/actividad.service';
import { Actividad } from 'src/app/Models/actividad';
import { ConfirmDialogComponent } from '../training/confirm-dialog/confirm-dialog.component';
import { UsuarioSigueUsuario } from 'src/app/Models/usuario-sigue-usuario';
import { UsuarioSigueUsuarioService } from 'src/app/Services/usuario-sigue-usuario.service';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  viewedUser:Usuario = new Usuario
  currentUser:Usuario = new Usuario
  CurrentDate = new Date()
  years:number | undefined
  public filesList:any = []
  public previsualization:string | undefined
  animal: string | undefined;
  listActivities:Actividad [] = []
  listFollowedUsers:UsuarioSigueUsuario [] = []
  newFollow:UsuarioSigueUsuario =  new UsuarioSigueUsuario
  followed:boolean = false
  buttonName:string = "Follow"
  iconName:string = "person_add"
  buttonColor:string = "primary"

  constructor(private userService:UsuarioService, private _snackBar: MatSnackBar, public matDialog: MatDialog, private activityService:ActividadService, private followUserService:UsuarioSigueUsuarioService) { }

  ngOnInit(): void {
    this.loadViewedUser();
    this.activityService.getActivities().subscribe((res: any)=>{
      this.listActivities = res.reverse()
    })
    this.followUserService.getUsuarioSigueUsuarios().subscribe((res: any)=>{
      this.listFollowedUsers = res
      this.IsUserFollowed()
    })
  }

  IsUserFollowed(){
    for (var i=0; i<this.listFollowedUsers.length; i++){
      if(this.listFollowedUsers[i].id_user == this.currentUser.usuario && this.listFollowedUsers[i].user_sigue == this.viewedUser.usuario){
        this.followed = true
        this.buttonName = "Following"
        this.iconName = "done"
        this.buttonColor = "basic"
        break
      }
    }
  }

  followUser() {
    this.newFollow.id_user = this.currentUser.usuario
    this.newFollow.user_sigue = this.viewedUser.usuario
    if(this.followed == true) {
    }else{
      console.log(this.newFollow)
      this.followUserService.insertUsuarioSigueUsuario(this.newFollow).subscribe(()=>{
        this.error("Ahora sigues a este usuario!")
        this.buttonName = "Following"
        this.iconName = "done"
        this.buttonColor = "basic"
        this.followed = true
      }, ()=>this.error("No se pudo realizar el proceso, por favor intente de nuevo!"))
    }
  }

  loadViewedUser() {
    this.viewedUser = this.userService.getViewedUser()
    this.currentUser = this.userService.getCurrentUser()

    this.years =  moment(this.CurrentDate).diff(moment(this.viewedUser.fecha_nacimiento), 'years')
  }

  error(message:string) {
    this._snackBar.open(message, '',{
      duration: 5000,
      horizontalPosition: 'center',
      verticalPosition: 'bottom'
    })
  }
}
