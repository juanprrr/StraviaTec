import { Component, OnInit } from '@angular/core';
import { UsuarioService } from 'src/app/Services/usuario.service';
import * as moment from 'moment';
import { MatTableDataSource } from '@angular/material/table';
import { Usuario } from 'src/app/Models/usuario';

@Component({
  selector: 'app-friends',
  templateUrl: './friends.component.html',
  styleUrls: ['./friends.component.css']
})
export class FriendsComponent implements OnInit {
  displayedColumns: string[] = ['usuario', 'nombre', 'apellidos', 'nacionalidad', 'iconos'];
  CurrentDate = new Date()
  dataSource:any;

  constructor(private userService:UsuarioService) { }

  ngOnInit(): void {
    this.userService.getUsers().subscribe((res: any)=>{
      this.dataSource = new MatTableDataSource(res);
    })
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  viewUserProfile(friend: Usuario) {
    this.userService.setViewedUser(friend)
  }

  getUserYears(userDate:Date): number {
    let years = moment(this.CurrentDate).diff(moment(userDate), 'years')

    return years
  }
}
