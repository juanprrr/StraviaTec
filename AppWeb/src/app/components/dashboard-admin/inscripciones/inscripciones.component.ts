import { Component, OnInit } from '@angular/core';

export interface TableElement {
  Nombre: string;
  Admin: string;
  
}

const ELEMENT_DATA: TableElement[] = [
  {Nombre: 'Grupo Cartago', Admin: 'Jorge Jimenez'},
  {Nombre: 'Grupo Alajuelense', Admin: 'Carlos Perez'},
  {Nombre: 'Grupo Caminantes', Admin: 'Grace Ulloa'},
];

@Component({
  selector: 'app-inscripciones',
  templateUrl: './inscripciones.component.html',
  styleUrls: ['./inscripciones.component.css']
})
export class InscripcionesComponent implements OnInit {

  displayedColumns: string[] = ['Nombre', 'Admin', 'acciones'];
  dataSource = ELEMENT_DATA;
  constructor() { }

  ngOnInit(): void {
  }

}

