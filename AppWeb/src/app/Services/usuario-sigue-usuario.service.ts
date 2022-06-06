import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/internal/Observable';
import { UsuarioSigueUsuario } from '../Models/usuario-sigue-usuario';

@Injectable({
  providedIn: 'root'
})
export class UsuarioSigueUsuarioService {
  url = '/api/Usuario_Sigue_Usuario';

  constructor(private httpclient:HttpClient) { }

  //GetUsuarioSigueUsuarios
  getUsuarioSigueUsuarios():Observable<any>{
    return this.httpclient.get(this.url)
  }
  //GetUsuarioSigueUsuariobyId
  getUsuarioSigueUsuariobyId(Id:string):Observable<any>{
    let params = new HttpParams().set('id', Id)
    return this.httpclient.get<UsuarioSigueUsuario>(this.url, {params:params})
  }
  //PostUsuarioSigueUsuario
  insertUsuarioSigueUsuario(user:UsuarioSigueUsuario):Observable<any>{
    return this.httpclient.post(this.url, user, this.generateHeaders())
  }
  //UpdateUsuarioSigueUsuario
  updateUsuarioSigueUsuario(actividad:UsuarioSigueUsuario):Observable<any>{
    return this.httpclient.put(this.url + "/" + actividad.id_user, actividad,  this.generateHeaders())
  }
  //DeleteUsuarioSigueUsuario
  deleteUsuarioSigueUsuario(Id:string):Observable<any>{
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
