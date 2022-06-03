using System.ComponentModel.DataAnnotations;
using System.Xml;

namespace StraviaTec.API.Models
{
    public class Actividad
    {
        [Key]
        public int id { get; set; }
        public int? id_reto { get; set; }
        public string id_usuario { get; set; }
        public TimeSpan hora_inicio { get; set; }
        public TimeSpan hora_fin { get; set; }
        public string tipo_actividad { get; set; }
        public int kilometraje { get; set; }
        public DateTime fecha { get; set; }
        public string? recorrido { get; set; }
    }
}
