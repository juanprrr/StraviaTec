using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class PagoCarrera
    {
        [Key]
        public int codigo { get; set; }
        public int id_carrera { get; set; }
        public string estado { get; set; }
    }
}
