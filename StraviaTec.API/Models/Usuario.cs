using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Usuario
    {
        [Key]
        public string usuario { get; set; }
        public int id_rol { get; set; }
        public int id_carrera { get; set; }
        public string nombre { get; set; }
        public string apellido1 { get; set; }
        public string apellido2 { get; set; }
        public string foto { get; set; }
        public string nacionalidad { get; set; }
        public string password { get; set; }
        public int fecha_nacimiento { get; set; }
    }
}
