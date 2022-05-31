import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { Usuario } from 'src/app/Models/usuario';
import { UsuarioService } from 'src/app/Services/usuario.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  logo = 'http://assets.stickpng.com/images/5847ea22cef1014c0b5e4833.png'
  form: FormGroup
  usersList:Usuario[] = []
  logged:Boolean = false
  
  constructor(private router: Router, private fb: FormBuilder, private _snackBar: MatSnackBar, private userService:UsuarioService) { 
    this.form = this.fb.group({
      usuario: ['', Validators.required],
      password: ['', Validators.required]
    })
  }

  ngOnInit(): void {
    this.userService.getUsers().subscribe((data:any)=>{this.usersList = data})
  }

  goToPage(pageName:string){
    this.router.navigate([`${pageName}`]);
  }

  checkLoginDeportistas(){
    const usuario = this.form.value.usuario;
    const password = this.form.value.password;
    for (var i=0; i<this.usersList.length; i++){
      if (usuario == this.usersList[i].usuario && password == this.usersList[i]._password && this.usersList[i].id_rol == 2) {
        this.goToPage('/dashboard')
        this.logged = true
      }
    }
    if (!this.logged){
      this.error()
    }
  }

  ingresarAdmin() {
    const usuario = this.form.value.usuario;
    const password = this.form.value.password;
    if(usuario == 'EM' && password == 'em'){
      this.router.navigateByUrl('/dashboard-admin');
    }else{
      this.error()
    }
  }

  error() {
    this._snackBar.open('Usuario o contraseña invalido!', '',{
      duration: 5000,
      horizontalPosition: 'center',
      verticalPosition: 'bottom'
    })
  }

}
