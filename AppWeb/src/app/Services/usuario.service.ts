import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Usuario } from '../Models/usuario';

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {
  url = '/api/Usuario';

  currentUser:Usuario = new Usuario

  constructor(private httpclient:HttpClient) { }

  getCurrentUser(){
    return this.currentUser
  }

  setCurrentUser(user:Usuario) {
    this.currentUser = user
  }

  //GetUsers
  getUsers():Observable<any>{
    return this.httpclient.get(this.url)
  }
  //GetUserbyId
  getUserbyId(Id:string):Observable<Usuario>{
    let params = new HttpParams().set('id', Id)
    return this.httpclient.get<Usuario>(this.url, {params:params})
  }
  //PostUser
  insertUser(user:Usuario):Observable<any>{
    return this.httpclient.post(this.url, user, this.generateHeaders())
  }
  //UpdateUser
  updateUser(user:Usuario):Observable<any>{
    return this.httpclient.put(this.url + "/" + user.usuario, user,  this.generateHeaders())
  }
  //DeleteUser
  deleteUser(Id:number):Observable<any>{
    return this.httpclient.delete(this.url + "/" +  Id, this.generateHeaders())
  }
  private generateHeaders = () => {
    return {
      headers: new HttpHeaders({
        "Access-Control-Allow-Origin": "*", 
        'Content-Type': 'application/json'
      })
    }
  }
}
