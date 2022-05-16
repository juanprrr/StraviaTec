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
    public class Cuenta_BancariaController : ControllerBase
    {
        private readonly ToDoDbContext _context;

        public Cuenta_BancariaController(ToDoDbContext context)
        {
            _context = context;
        }

        // GET: api/Cuenta_Bancaria
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Cuenta_Bancaria>>> GetCuenta_Bancaria()
        {
          if (_context.Cuenta_Bancaria == null)
          {
              return NotFound();
          }
            return await _context.Cuenta_Bancaria.ToListAsync();
        }

        // GET: api/Cuenta_Bancaria/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Cuenta_Bancaria>> GetCuenta_Bancaria(int id)
        {
          if (_context.Cuenta_Bancaria == null)
          {
              return NotFound();
          }
            var cuenta_Bancaria = await _context.Cuenta_Bancaria.FindAsync(id);

            if (cuenta_Bancaria == null)
            {
                return NotFound();
            }

            return cuenta_Bancaria;
        }

        // PUT: api/Cuenta_Bancaria/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCuenta_Bancaria(int id, Cuenta_Bancaria cuenta_Bancaria)
        {
            if (id != cuenta_Bancaria.id)
            {
                return BadRequest();
            }

            _context.Entry(cuenta_Bancaria).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Cuenta_BancariaExists(id))
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

        // POST: api/Cuenta_Bancaria
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Cuenta_Bancaria>> PostCuenta_Bancaria(Cuenta_Bancaria cuenta_Bancaria)
        {
          if (_context.Cuenta_Bancaria == null)
          {
              return Problem("Entity set 'ToDoDbContext.Cuenta_Bancaria'  is null.");
          }
            _context.Cuenta_Bancaria.Add(cuenta_Bancaria);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCuenta_Bancaria", new { id = cuenta_Bancaria.id }, cuenta_Bancaria);
        }

        // DELETE: api/Cuenta_Bancaria/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCuenta_Bancaria(int id)
        {
            if (_context.Cuenta_Bancaria == null)
            {
                return NotFound();
            }
            var cuenta_Bancaria = await _context.Cuenta_Bancaria.FindAsync(id);
            if (cuenta_Bancaria == null)
            {
                return NotFound();
            }

            _context.Cuenta_Bancaria.Remove(cuenta_Bancaria);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool Cuenta_BancariaExists(int id)
        {
            return (_context.Cuenta_Bancaria?.Any(e => e.id == id)).GetValueOrDefault();
        }
    }
}
