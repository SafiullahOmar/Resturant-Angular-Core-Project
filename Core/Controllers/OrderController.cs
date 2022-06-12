using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Core.Model;

namespace Core.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly ResturantContext _context;

        public OrderController(ResturantContext context)
        {
            _context = context;
        }

        // GET: api/Order
        [HttpGet]
        public async Task<System.Object> GetOrders()
        {
            var result = (from a in _context.Orders join b in _context.Customers
                           on a.CustomerId equals b.CustomerId

                          select new { 
                          a.OrderId,
                          a.OrderNo,
                          a.Pmethod,
                          a.Gtotal,
                          customer=b.Name
                          }
                          );
            return  result;
        }

        // GET: api/Order/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Order>> GetOrder(long id)
        {
            var order = ( from a in _context.Orders
                          where a.OrderId==id
                          select new { 
                          a.OrderId,
                          a.OrderNo,
                          a.CustomerId,
                          a.Pmethod,
                          a.Gtotal
                          }
                          
                          ).FirstOrDefault();
            var orderDetails = (from a in _context.OrderItems 
                                join b in _context.Items on a.ItemId equals b.ItemId
                                where a.OrderId==id
                                select new { 
                                a.OrderId,
                                a.OrderItemId,
                                a.ItemId,
                                itemName=b.Name,
                                b.Price,
                                a.Quantity,
                                total=a.Quantity*b.Price
                                }
                                ).ToList();

            return Ok(new { order, orderDetails });
        }

        // PUT: api/Order/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOrder(long id, Order order)
        {
            if (id != order.OrderId)
            {
                return BadRequest();
            }

            _context.Entry(order).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderExists(id))
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

        // POST: api/Order
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Order>> PostOrder(Order order)
        {

            try {
                _context.Orders.Add(order);

                foreach (var item in order.OrderItems) {
                    _context.OrderItems.Add(item);
                }
                await _context.SaveChangesAsync();

                return Ok();

            }
            catch (Exception ex) {
                throw ex;
            }
            
        }

        // DELETE: api/Order/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOrder(long id)
        {
            var order = await _context.Orders.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }

            _context.Orders.Remove(order);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OrderExists(long id)
        {
            return _context.Orders.Any(e => e.OrderId == id);
        }
    }
}
