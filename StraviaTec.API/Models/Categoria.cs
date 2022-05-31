using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Categoria
    {
        [Key]
        public int nombre { get; set; }
        public string descripcion { get; set; }
        public int id_carrera { get; set; }
    }
}
