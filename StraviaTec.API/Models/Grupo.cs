using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Grupo
    {
        [Key]
        public int id { get; set; }
        public int id_admin { get; set; }
        public int id_carrera { get; set; }
        public string nombre { get; set; }
    }
}
