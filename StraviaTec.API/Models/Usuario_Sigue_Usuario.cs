using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace StraviaTec.API.Models
{
    public class Usuario_Sigue_Usuario
    {
        [Key, Column(Order = 1)]
        public string id_user { get; set; }
        [Key, Column(Order = 2)]
        public string user_sigue { get; set; }
    }
}
