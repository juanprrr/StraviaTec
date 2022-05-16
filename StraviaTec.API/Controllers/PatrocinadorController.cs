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
    public class PatrocinadorController : ControllerBase
    {
        private readonly ToDoDbContext _context;

        public PatrocinadorController(ToDoDbContext context)
        {
            _context = context;
        }

        // GET: api/Patrocinador
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Patrocinador>>> GetPatrocinador()
        {
          if (_context.Patrocinador == null)
          {
              return NotFound();
          }
            return await _context.Patrocinador.ToListAsync();
        }

        // GET: api/Patrocinador/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Patrocinador>> GetPatrocinador(int id)
        {
          if (_context.Patrocinador == null)
          {
              return NotFound();
          }
            var patrocinador = await _context.Patrocinador.FindAsync(id);

            if (patrocinador == null)
            {
                return NotFound();
            }

            return patrocinador;
        }

        // PUT: api/Patrocinador/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPatrocinador(int id, Patrocinador patrocinador)
        {
            if (id != patrocinador.id)
            {
                return BadRequest();
            }

            _context.Entry(patrocinador).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PatrocinadorExists(id))
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

        // POST: api/Patrocinador
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Patrocinador>> PostPatrocinador(Patrocinador patrocinador)
        {
          if (_context.Patrocinador == null)
          {
              return Problem("Entity set 'ToDoDbContext.Patrocinador'  is null.");
          }
            _context.Patrocinador.Add(patrocinador);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPatrocinador", new { id = patrocinador.id }, patrocinador);
        }

        // DELETE: api/Patrocinador/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePatrocinador(int id)
        {
            if (_context.Patrocinador == null)
            {
                return NotFound();
            }
            var patrocinador = await _context.Patrocinador.FindAsync(id);
            if (patrocinador == null)
            {
                return NotFound();
            }

            _context.Patrocinador.Remove(patrocinador);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PatrocinadorExists(int id)
        {
            return (_context.Patrocinador?.Any(e => e.id == id)).GetValueOrDefault();
        }
    }
}
