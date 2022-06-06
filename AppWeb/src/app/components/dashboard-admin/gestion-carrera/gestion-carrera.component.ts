import { Component, OnInit } from '@angular/core';

export interface TableElement {
  Nombre: string;
  Fecha: string;
  Recorrido: string;
  Tipo: string;
}

const ELEMENT_DATA: TableElement[] = [
  {Nombre: 'Reto Irazu', Fecha: '11/11/2022', Recorrido: 'Prusia', Tipo: 'Carrera'},
  {Nombre: 'Reto Poas', Fecha: '11/11/2022', Recorrido: 'Poas', Tipo: 'Caminata'},
  {Nombre: 'Aguas abiertas', Fecha: '11/11/2022', Recorrido: 'Herradura', Tipo: 'Natacion'},
  {Nombre: 'Valle de Orosi', Fecha: '11/11/2022', Recorrido: 'Orosi', Tipo: 'Ciclismo'},
  {Nombre: 'Jaco Extremo', Fecha: '11/11/2022', Recorrido: 'Jaco', Tipo: 'Reto'},
];

@Component({
  selector: 'app-gestion-carrera',
  templateUrl: './gestion-carrera.component.html',
  styleUrls: ['./gestion-carrera.component.css']
})

export class GestionCarreraComponent implements OnInit {

  displayedColumns: string[] = ['Nombre', 'Fecha', 'Recorrido', 'Tipo'];
  dataSource = ELEMENT_DATA;
  constructor() { }

  ngOnInit(): void {
  }

}

