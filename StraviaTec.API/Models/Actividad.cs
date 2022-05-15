using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Actividad
    {
        [Key]
        public int id { get; set; }
        public int id_reto { get; set; }
        public int id_usuario { get; set; }
        public DateTime fecha { get; set; }
        public TimeOnly hora_inicio { get; set; }
        public TimeOnly hora_fin { get; set; }
        public float kilometraje { get; set; }
        public float recorrido { get; set; }
        public string tipo_actividad { get; set; }
    }
}
