using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Assignment
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Instructions { get; set; }

        [DataType(DataType.Date)]
        public DateTime? DueDate { get; set; }

        [DisplayName("Classroom")]
        [Required]
        public int ClassId { get; set; }
        public Class Class { get; set; }

    }
}
