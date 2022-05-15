using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Categorias
    {
        [Key]
        public int codigo { get; set; }
        public string tipo { get; set; }
    }
}
