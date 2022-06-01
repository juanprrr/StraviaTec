import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-crear-actividad',
  templateUrl: './crear-actividad.component.html',
  styleUrls: ['./crear-actividad.component.css']
})
export class CrearActividadComponent implements OnInit {
  foods: any[] = [
    {value: 'Correr', viewValue: 'Correr'},
    {value: 'Natación', viewValue: 'Natación'},
    {value: 'Ciclismo', viewValue: 'Ciclismo'},
    {value: 'Senderismo', viewValue: 'Senderismo'},
    {value: 'Kayak', viewValue: 'Kayak'},
    {value: 'Caminata', viewValue: 'Caminata'}
  ];

  constructor() { }

  ngOnInit(): void {
  }

}
