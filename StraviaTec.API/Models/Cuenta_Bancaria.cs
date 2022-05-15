using System.ComponentModel.DataAnnotations;

namespace StraviaTec.API.Models
{
    public class Cuenta_Bancaria
    {
        [Key]
        public int id { get; set; }
        public string cuenta { get; set; }
    }
}
