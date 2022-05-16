using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Categoria
    {
        [Key]
        public int codigo { get; set; }
        public string tipo { get; set; }
    }
}
