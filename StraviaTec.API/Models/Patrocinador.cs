using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Patrocinador
    {
        [Key]
        public int id { get; set; }
        public string nombre_comercial { get; set; }
        public string nombre_rep { get; set; }
        public string apellido1_rep { get; set; }
        public string apellido2_rep { get; set; }
        public int telefono_rep { get; set; }
        public string logo { get; set; }
    }
}
