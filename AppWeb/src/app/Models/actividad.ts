import { Time } from "@angular/common"

export class Actividad {
    id:number | undefined
    id_reto:number | undefined
    id_usuario:string | undefined
    hora_inicio:Time | undefined
    hora_fin:Time | undefined
    tipo_actividad:string | undefined
    kilometraje:number | undefined
    fecha:Date | undefined
    recorrido:string | undefined
}
