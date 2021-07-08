using Capstone.Models;
using Capstone.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AssignmentController : ControllerBase
    {
        private readonly IAssignmentRepository _assignmentRepository;
        public AssignmentController(IAssignmentRepository assignmentRepository)
        {
            _assignmentRepository = assignmentRepository;
        }

        // GET api/<AssignmentController>/
        [HttpGet]
        public IActionResult GetOne(int id)
        {
            var assignment = _assignmentRepository.GetAssignment(id);
            if (assignment == null)
            {
                return NotFound();
            }
            return Ok(assignment);
        }

        // GET api/<AssignmentController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var assignment = _assignmentRepository.GetAllByClass(id);
            if (assignment == null)
            {
                return NotFound();
            }
            return Ok(assignment);
        }

        // POST api/<AssignmentController>
        [HttpPost]
        public IActionResult Add(Assignment assignment)
        {
            _assignmentRepository.AddAssignment(assignment);
            return CreatedAtAction("Get", new { id = assignment.Id }, assignment);
        }

        // DELETE api/<AssignmentController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _assignmentRepository.DeleteAssignment(id);
            return NoContent();
        }

        // PUT api/<AssignmentController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, Assignment assignment)

        {
            if (id != assignment.Id)
            {
                return BadRequest();
            }

            _assignmentRepository.EditAssignment(assignment);
            return NoContent();
        }
    }
}
