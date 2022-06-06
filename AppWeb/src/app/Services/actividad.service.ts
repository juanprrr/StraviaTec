import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Actividad } from '../Models/actividad';

@Injectable({
  providedIn: 'root'
})
export class ActividadService {
  url = '/api/Actividad';

  constructor(private httpclient:HttpClient) { }

  //GetActividades
  getActivities():Observable<any>{
    return this.httpclient.get(this.url)
  }
  //GetActividadbyId
  getActivitybyId(Id:string):Observable<Actividad>{
    let params = new HttpParams().set('id', Id)
    return this.httpclient.get<Actividad>(this.url, {params:params})
  }
  //PostActividad
  insertActivity(user:Actividad):Observable<any>{
    return this.httpclient.post(this.url, user, this.generateHeaders())
  }
  //UpdateActividad
  updateActivity(actividad:Actividad):Observable<any>{
    return this.httpclient.put(this.url + "/" + actividad.id, actividad,  this.generateHeaders())
  }
  //DeleteActividad
  deleteActivity(Id:number):Observable<any>{
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
