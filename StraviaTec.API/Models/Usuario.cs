using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Usuario
    {
        [Key]
        public string usuario { get; set; }
        public int id_rol { get; set; }
        public int? id_carrera { get; set; }
        public string nombre { get; set; }
        public string apellido1 { get; set; }
        public string apellido2 { get; set; }
        public Byte[]? foto { get; set; }
        public string nacionalidad { get; set; }
        public string _password { get; set; }
        public DateTime fecha_nacimiento { get; set; }
    }
}
