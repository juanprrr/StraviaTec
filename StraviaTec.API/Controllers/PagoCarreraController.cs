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
    public class PagoCarreraController : ControllerBase
    {
        private readonly ToDoDbContext _context;

        public PagoCarreraController(ToDoDbContext context)
        {
            _context = context;
        }

        // GET: api/PagoCarrera
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PagoCarrera>>> GetPagoCarrera()
        {
          if (_context.PagoCarrera == null)
          {
              return NotFound();
          }
            return await _context.PagoCarrera.ToListAsync();
        }

        // GET: api/PagoCarrera/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PagoCarrera>> GetPagoCarrera(int id)
        {
          if (_context.PagoCarrera == null)
          {
              return NotFound();
          }
            var pagoCarrera = await _context.PagoCarrera.FindAsync(id);

            if (pagoCarrera == null)
            {
                return NotFound();
            }

            return pagoCarrera;
        }

        // PUT: api/PagoCarrera/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPagoCarrera(int id, PagoCarrera pagoCarrera)
        {
            if (id != pagoCarrera.codigo)
            {
                return BadRequest();
            }

            _context.Entry(pagoCarrera).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PagoCarreraExists(id))
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

        // POST: api/PagoCarrera
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<PagoCarrera>> PostPagoCarrera(PagoCarrera pagoCarrera)
        {
          if (_context.PagoCarrera == null)
          {
              return Problem("Entity set 'ToDoDbContext.PagoCarrera'  is null.");
          }
            _context.PagoCarrera.Add(pagoCarrera);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (PagoCarreraExists(pagoCarrera.codigo))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetPagoCarrera", new { id = pagoCarrera.codigo }, pagoCarrera);
        }

        // DELETE: api/PagoCarrera/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePagoCarrera(int id)
        {
            if (_context.PagoCarrera == null)
            {
                return NotFound();
            }
            var pagoCarrera = await _context.PagoCarrera.FindAsync(id);
            if (pagoCarrera == null)
            {
                return NotFound();
            }

            _context.PagoCarrera.Remove(pagoCarrera);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PagoCarreraExists(int id)
        {
            return (_context.PagoCarrera?.Any(e => e.codigo == id)).GetValueOrDefault();
        }
    }
}
