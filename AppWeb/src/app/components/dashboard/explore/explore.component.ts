import { Component, OnInit } from '@angular/core';
import { UsuarioService } from 'src/app/Services/usuario.service';
import * as moment from 'moment';
import { MatTableDataSource } from '@angular/material/table';
import { Usuario } from 'src/app/Models/usuario';
import { Router } from '@angular/router';

@Component({
  selector: 'app-explore',
  templateUrl: './explore.component.html',
  styleUrls: ['./explore.component.css']
})
export class ExploreComponent implements OnInit {
  displayedColumns: string[] = ['usuario', 'nombre', 'iconos'];
  currentUser = new Usuario()
  CurrentDate = new Date()
  dataSource:any;

  constructor(private router: Router, private userService:UsuarioService) { }

  ngOnInit(): void {
    this.userService.getUsers().subscribe((res: any)=>{
      this.dataSource = new MatTableDataSource(res);
    })
    this.loadCurrentUser()
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  viewUserProfile(friend: Usuario) {
    this.userService.setViewedUser(friend)
    console.log(friend.usuario)
    console.log(this.currentUser.usuario)
    if (friend.usuario == this.currentUser.usuario) {
      this.goToPage("/dashboard/training")
    }else{
      this.goToPage("/dashboard/profile")
    }
  }

  loadCurrentUser() {
    this.currentUser = this.userService.getCurrentUser()
  }

  goToPage(pageName:string){
    this.router.navigate([`${pageName}`]);
  }

  getUserYears(userDate:Date): number {
    let years = moment(this.CurrentDate).diff(moment(userDate), 'years')

    return years
  }
}
