using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StraviaTec.API.Models;
using StraviaTec.API.Services;

namespace StraviaTec.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Usuario_Sigue_UsuarioController : ControllerBase
    {
        private readonly ToDoDbContext _context;

        public Usuario_Sigue_UsuarioController(ToDoDbContext context)
        {
            _context = context;
        }

        // GET: api/Usuario_Sigue_Usuario
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Usuario_Sigue_Usuario>>> GetUsuario_Sigue_Usuario()
        {
          if (_context.Usuario_Sigue_Usuario == null)
          {
              return NotFound();
          }
            return await _context.Usuario_Sigue_Usuario.ToListAsync();
        }

        // GET: api/Usuario_Sigue_Usuario/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Usuario_Sigue_Usuario>> GetUsuario_Sigue_Usuario(string id)
        {
          if (_context.Usuario_Sigue_Usuario == null)
          {
              return NotFound();
          }
            var usuario_Sigue_Usuario = await _context.Usuario_Sigue_Usuario.FindAsync(id);

            if (usuario_Sigue_Usuario == null)
            {
                return NotFound();
            }

            return usuario_Sigue_Usuario;
        }

        // PUT: api/Usuario_Sigue_Usuario/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUsuario_Sigue_Usuario(string id, Usuario_Sigue_Usuario usuario_Sigue_Usuario)
        {
            if (id != usuario_Sigue_Usuario.id_user)
            {
                return BadRequest();
            }

            _context.Entry(usuario_Sigue_Usuario).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Usuario_Sigue_UsuarioExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Usuario_Sigue_Usuario
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Usuario_Sigue_Usuario>> PostUsuario_Sigue_Usuario(Usuario_Sigue_Usuario usuario_Sigue_Usuario)
        {
          if (_context.Usuario_Sigue_Usuario == null)
          {
              return Problem("Entity set 'ToDoDbContext.Usuario_Sigue_Usuario'  is null.");
          }
            _context.Usuario_Sigue_Usuario.Add(usuario_Sigue_Usuario);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (Usuario_Sigue_UsuarioExists(usuario_Sigue_Usuario.id_user))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetUsuario_Sigue_Usuario", new { id = usuario_Sigue_Usuario.id_user }, usuario_Sigue_Usuario);
        }

        // DELETE: api/Usuario_Sigue_Usuario/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUsuario_Sigue_Usuario(string id)
        {
            if (_context.Usuario_Sigue_Usuario == null)
            {
                return NotFound();
            }
            var usuario_Sigue_Usuario = await _context.Usuario_Sigue_Usuario.FindAsync(id);
            if (usuario_Sigue_Usuario == null)
            {
                return NotFound();
            }

            _context.Usuario_Sigue_Usuario.Remove(usuario_Sigue_Usuario);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool Usuario_Sigue_UsuarioExists(string id)
        {
            return (_context.Usuario_Sigue_Usuario?.Any(e => e.id_user == id)).GetValueOrDefault();
        }
    }
}
