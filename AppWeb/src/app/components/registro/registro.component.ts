import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { Usuario } from 'src/app/Models/usuario';
import { UsuarioService } from 'src/app/Services/usuario.service';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent implements OnInit {
  //form: FormGroup
  newUser:Usuario = new Usuario

  constructor(private userService:UsuarioService, public router: Router) { }

  ngOnInit(): void {
    this.userService.getUsers().subscribe((res: any)=>{
      console.log('Res: ', res)
    })
  }

  goToPage(pageName:string){
    this.router.navigate([`${pageName}`]);
  }
  
  addUser(newUse:Usuario){
    newUse.id_rol = 2
    newUse.id_carrera = undefined
    newUse.foto = undefined
    this.userService.insertUser(newUse).subscribe(()=>{
      window.location.reload()
      alert("Registro completado!")
    },()=>alert("No se pudo registrar su usuario, por favor intente de nuevo!"))
  }
}
