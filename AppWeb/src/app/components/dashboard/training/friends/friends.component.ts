import { Component, OnInit } from '@angular/core';
import { UsuarioService } from 'src/app/Services/usuario.service';
import * as moment from 'moment';
import { MatTableDataSource } from '@angular/material/table';
import { Usuario } from 'src/app/Models/usuario';
import { UsuarioSigueUsuarioService } from 'src/app/Services/usuario-sigue-usuario.service';
import { UsuarioSigueUsuario } from 'src/app/Models/usuario-sigue-usuario';

@Component({
  selector: 'app-friends',
  templateUrl: './friends.component.html',
  styleUrls: ['./friends.component.css']
})
export class FriendsComponent implements OnInit {
  displayedColumns: string[] = ['usuario', 'nombre', 'apellidos', 'nacionalidad', 'iconos'];
  currentUser:Usuario = new Usuario
  CurrentDate = new Date();
  dataSource:any;

  constructor(private userService:UsuarioService, private followUserService:UsuarioSigueUsuarioService) { }

  ngOnInit(): void {
    this.loadCurrentUser()
    this.userService.getUsers().subscribe((res: any)=>{
      this.getFollowedUsers(res)
    })
  }

  getFollowedUsers(allUsers:any) {
    let listFollowedUsers: Usuario[] = []

    this.followUserService.getUsuarioSigueUsuarios().subscribe((res: any)=>{
      
      for (var i=0; i<res.length; i++){
        if (res[i].id_user == this.currentUser.usuario) {
          for (var j=0; j<allUsers.length; j++){
            if (res[i].user_sigue == allUsers[j].usuario){
              listFollowedUsers.push(allUsers[j])
            }
          }
        }
      }

      this.dataSource = new MatTableDataSource(listFollowedUsers);
    })
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  loadCurrentUser() {
    this.currentUser = this.userService.getCurrentUser()
  }

  viewUserProfile(friend: Usuario) {
    this.userService.setViewedUser(friend)
  }

  getUserYears(userDate:Date): number {
    let years = moment(this.CurrentDate).diff(moment(userDate), 'years')

    return years
  }
}
