using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Reto
    {
        [Key]
        public int id { get; set; }
        public string nombre { get; set; }
        public DateTime fecha_inicio { get; set; }
        public DateTime fecha_fin { get; set; }
        public string tipo_actividad { get; set; }
        public string tipo_reto { get; set; }
    }
}
