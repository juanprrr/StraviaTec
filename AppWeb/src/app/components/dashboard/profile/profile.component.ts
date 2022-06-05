import { Component, OnInit } from '@angular/core';
import { Usuario } from 'src/app/Models/usuario';
import { UsuarioService } from 'src/app/Services/usuario.service';
import * as moment from 'moment';
import { MatDialog } from '@angular/material/dialog';
import { ActividadService } from 'src/app/Services/actividad.service';
import { Actividad } from 'src/app/Models/actividad';
import { ConfirmDialogComponent } from '../training/confirm-dialog/confirm-dialog.component';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  viewedUser:Usuario = new Usuario
  CurrentDate = new Date()
  years:number | undefined
  public filesList:any = []
  public previsualization:string | undefined
  animal: string | undefined;
  listActivities:Actividad [] = []

  constructor(private userService:UsuarioService, public matDialog: MatDialog, private activityService:ActividadService) { }

  ngOnInit(): void {
    this.loadViewedUser();
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

  loadViewedUser() {
    this.viewedUser = this.userService.getViewedUser()

    this.years =  moment(this.CurrentDate).diff(moment(this.viewedUser.fecha_nacimiento), 'years')
  }
}
