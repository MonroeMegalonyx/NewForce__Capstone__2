using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Class
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
        
        [DisplayName("Teacher")]
        [Required]
        public int TeacherId { get; set; }
        public UserProfile UserProfile { get; set; }

        public DateTime? Begin { get; set; }

        public DateTime? End { get; set; }

    }
}
