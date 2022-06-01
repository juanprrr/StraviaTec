import { Component, OnInit } from '@angular/core';
import { Usuario } from 'src/app/Models/usuario';
import { UsuarioService } from 'src/app/Services/usuario.service';
import * as moment from 'moment';

@Component({
  selector: 'app-training',
  templateUrl: './training.component.html',
  styleUrls: ['./training.component.css']
})
export class TrainingComponent implements OnInit {
  currentUser:Usuario = new Usuario
  CurrentDate = new Date()
  years:number | undefined
  
  constructor(private userService:UsuarioService) { }

  ngOnInit(): void {
    this.loadCurrentUser();
  }

  loadCurrentUser() {
    this.currentUser = this.userService.getCurrentUser()

    this.years =  moment(this.CurrentDate).diff(moment(this.currentUser.fecha_nacimiento), 'years')
  }
}
