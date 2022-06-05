using Microsoft.EntityFrameworkCore;
using StraviaTec.API.Models;

namespace StraviaTec.API.Services
{
    public class ToDoDbContext : DbContext
    {
        public ToDoDbContext(DbContextOptions<ToDoDbContext> options) : base(options) { }
        public DbSet<Actividad> Actividad { get; set; }
        public DbSet<Carrera> Carrera { get; set; }
        public DbSet<Categoria> Categoria { get; set; }
        public DbSet<Cuenta_Bancaria> Cuenta_Bancaria { get; set; }
        public DbSet<Grupo> Grupo { get; set; }
        public DbSet<PagoCarrera> PagoCarrera { get; set; }
        public DbSet<Patrocinador> Patrocinador { get; set; }
        public DbSet<Reto> Reto { get; set; }
        public DbSet<Rol> Rol { get; set; }
        public DbSet<Usuario> Usuario { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PagoCarrera>().HasKey(c => new { c.codigo, c.id_carrera });
            modelBuilder.Entity<Usuario_Sigue_Usuario>().HasKey(c => new { c.id_user, c.user_sigue });
        }
        public DbSet<StraviaTec.API.Models.Usuario_Sigue_Usuario> Usuario_Sigue_Usuario { get; set; }
    }
}
