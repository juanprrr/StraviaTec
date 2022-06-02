import { Component, OnInit } from '@angular/core';
import { Usuario } from 'src/app/Models/usuario';
import { UsuarioService } from 'src/app/Services/usuario.service';
import * as moment from 'moment';
import { DomSanitizer } from '@angular/platform-browser';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from './confirm-dialog/confirm-dialog.component';

@Component({
  selector: 'app-training',
  templateUrl: './training.component.html',
  styleUrls: ['./training.component.css']
})
export class TrainingComponent implements OnInit {
  currentUser:Usuario = new Usuario
  CurrentDate = new Date()
  years:number | undefined
  public filesList:any = []
  public previsualization:string | undefined
  animal: string | undefined;
  
  constructor(private userService:UsuarioService, public matDialog: MatDialog) { }

  ngOnInit(): void {
    this.loadCurrentUser();
  }

  openDialog(): void {
    const dialogRef = this.matDialog.open(ConfirmDialogComponent, {
      restoreFocus: false
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      this.animal = result;
    });
  }

  loadCurrentUser() {
    this.currentUser = this.userService.getCurrentUser()

    this.years =  moment(this.CurrentDate).diff(moment(this.currentUser.fecha_nacimiento), 'years')
  }
}
