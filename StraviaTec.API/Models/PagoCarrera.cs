using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StraviaTec.API.Models
{
    public class PagoCarrera
    {
        [Key, Column(Order = 1)]
        public int codigo { get; set; }
        [Key, Column(Order = 2)]
        public int id_carrera { get; set; }
        public string estado { get; set; }
    }
}
