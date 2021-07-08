using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.Repositories
{
    public interface IAssignmentRepository
    {
        Assignment GetAssignment(int id);
        List<Assignment> GetAllByClass(int classId);
        void AddAssignment(Assignment assignment);
        void DeleteAssignment(int assignmentId);
        void EditAssignment(Assignment assignment);
    }
}