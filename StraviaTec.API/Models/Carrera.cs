using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Carrera
    {
        [Key]
        public int id { get; set; }
        public int id_actividad { get; set; }
        public string nombre { get; set; }
        public string tipo_actividad { get; set; }
        public DateTime fecha_inicio { get; set; }
        public DateTime fecha_fin { get; set; }
        public float recorrido { get; set; }
        public float costo { get; set; }
    }
}
