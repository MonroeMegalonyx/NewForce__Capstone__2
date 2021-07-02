using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.Repositories
{
    public interface IAssignmentRepository
    {
        List<Assignment> GetAllByClass(int classId);
        void AddAssignment(Assignment assignment);
    }
}