import { Component, Inject, OnInit } from '@angular/core';
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
  name: string | undefined;
  
  constructor(private userService:UsuarioService, private sanitizer:DomSanitizer, public dialog: MatDialog) { }

  ngOnInit(): void {
    this.loadCurrentUser();
  }

  loadCurrentUser() {
    this.currentUser = this.userService.getCurrentUser()

    this.years =  moment(this.CurrentDate).diff(moment(this.currentUser.fecha_nacimiento), 'years')
  }

  getFile(event:any): any {
    const capturedFile = event.target.files[0]
    this.extractBase64(capturedFile).then((img:any) => {
      this.previsualization = img.base
      console.log(img)
    })
    this.filesList.push(capturedFile)
  }

  extractBase64 = async ($event: any) => new Promise((resolve, reject): any | undefined => {
    try {
      const unsafeImg = window.URL.createObjectURL($event);
      const image = this.sanitizer.bypassSecurityTrustUrl(unsafeImg);
      const reader = new FileReader();
      reader.readAsDataURL($event);
      reader.onload = () => {
        resolve({
          base: reader.result
        });
      };
      reader.onerror = error => {
        resolve({
          base: null
        });
      };

    } catch (e) {
      return null;
    }
  })

  openDialog(): void {
    const dialogRef = this.dialog.open(ConfirmDialogComponent, {
      width: '250px',
      restoreFocus: false
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      this.animal = result;
    });
  }
}
