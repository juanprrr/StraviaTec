import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  logo = 'http://assets.stickpng.com/images/5847ea22cef1014c0b5e4833.png'
  form: FormGroup
  
  constructor(private router: Router, private fb: FormBuilder, private _snackBar: MatSnackBar) { 
    this.form = this.fb.group({
      usuario: ['', Validators.required],
      password: ['', Validators.required]
    })
  }

  ngOnInit(): void {
  }

  ingresar() {
    const usuario = this.form.value.usuario;
    const password = this.form.value.password;
    if(usuario == 'SA' && password == 'sa'){
      this.router.navigateByUrl('/dashboard');
    }else{
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

  

  registrar() {
    this.router.navigateByUrl('/registro');
  }

  error() {
    this._snackBar.open('Usuario o contraseña invalido!', '',{
      duration: 5000,
      horizontalPosition: 'center',
      verticalPosition: 'bottom'
    })
  }

}
