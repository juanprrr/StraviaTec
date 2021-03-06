import { Component, OnInit } from '@angular/core';
import { Usuario } from 'src/app/Models/usuario';
import { UsuarioService } from 'src/app/Services/usuario.service';
import * as moment from 'moment';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from './confirm-dialog/confirm-dialog.component';
import { ActividadService } from 'src/app/Services/actividad.service';
import { Actividad } from 'src/app/Models/actividad';

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
  listActivities:Actividad [] = []
  
  constructor(private userService:UsuarioService, public matDialog: MatDialog, private activityService:ActividadService) { }

  ngOnInit(): void {
    this.loadCurrentUser();
    this.activityService.getActivities().subscribe((res: any)=>{
      this.listActivities = res.reverse()
    })
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
