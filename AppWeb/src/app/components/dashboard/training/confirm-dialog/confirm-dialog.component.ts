import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { DomSanitizer } from '@angular/platform-browser';
import { Usuario } from 'src/app/Models/usuario';
import { UsuarioService } from 'src/app/Services/usuario.service';

@Component({
  selector: 'app-confirm-dialog',
  templateUrl: './confirm-dialog.component.html',
  styleUrls: ['./confirm-dialog.component.css']
})
export class ConfirmDialogComponent implements OnInit {
  currentUser:Usuario = new Usuario
  public file:any
  public previsualization:string | undefined

  constructor(public dialogRef: MatDialogRef<ConfirmDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: string, private sanitizer:DomSanitizer, private userService:UsuarioService) { }

  ngOnInit(): void {
    this.loadCurrentUser();
  }

  loadCurrentUser() {
    this.currentUser = this.userService.getCurrentUser()
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

  getFile(event:any): any {
    const capturedFile = event.target.files[0]
    this.extractBase64(capturedFile).then((img:any) => {
      this.previsualization = img.base
      console.log(img)
    })
    this.file = capturedFile
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

  uploadFile() {
    this.currentUser.foto = this.file
    console.log(this.currentUser.nombre)
    /*
    this.userService.updateUser(this.currentUser)
      .subscribe(() => {
        alert("El vuelo se cerró exitosamente!")
      },
      () => alert("No se pudo cerrar el vuelo!"))
      */
  }
}
