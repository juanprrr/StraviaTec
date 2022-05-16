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
    public class RetoController : ControllerBase
    {
        private readonly ToDoDbContext _context;

        public RetoController(ToDoDbContext context)
        {
            _context = context;
        }

        // GET: api/Reto
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Reto>>> GetReto()
        {
          if (_context.Reto == null)
          {
              return NotFound();
          }
            return await _context.Reto.ToListAsync();
        }

        // GET: api/Reto/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Reto>> GetReto(int id)
        {
          if (_context.Reto == null)
          {
              return NotFound();
          }
            var reto = await _context.Reto.FindAsync(id);

            if (reto == null)
            {
                return NotFound();
            }

            return reto;
        }

        // PUT: api/Reto/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutReto(int id, Reto reto)
        {
            if (id != reto.id)
            {
                return BadRequest();
            }

            _context.Entry(reto).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RetoExists(id))
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

        // POST: api/Reto
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Reto>> PostReto(Reto reto)
        {
          if (_context.Reto == null)
          {
              return Problem("Entity set 'ToDoDbContext.Reto'  is null.");
          }
            _context.Reto.Add(reto);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetReto", new { id = reto.id }, reto);
        }

        // DELETE: api/Reto/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteReto(int id)
        {
            if (_context.Reto == null)
            {
                return NotFound();
            }
            var reto = await _context.Reto.FindAsync(id);
            if (reto == null)
            {
                return NotFound();
            }

            _context.Reto.Remove(reto);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool RetoExists(int id)
        {
            return (_context.Reto?.Any(e => e.id == id)).GetValueOrDefault();
        }
    }
}
