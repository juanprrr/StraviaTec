using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Rol
    {
        [Key]
        public int id { get; set; }
        public string nombre { get; set; }
    }
}
