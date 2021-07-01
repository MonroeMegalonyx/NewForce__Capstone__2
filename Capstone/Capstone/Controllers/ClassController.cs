using Capstone.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Capstone.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ClassController : ControllerBase
    {
        private readonly IClassRepository _classRepository;
        public ClassController(IClassRepository classRepository)
        {
            _classRepository = classRepository;
        }

        // GET api/<ClassController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var classroom = _classRepository.GetAllByTeacher(id);
            if (classroom == null)
            {
                return NotFound();
            }
            return Ok(classroom);
        }
    }
}
