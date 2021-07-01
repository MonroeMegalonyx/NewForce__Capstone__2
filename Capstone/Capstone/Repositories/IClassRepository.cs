using System.Collections.Generic;
using Capstone.Models;

namespace Capstone.Repositories
{
    public interface IClassRepository
    {
        List <Class> GetAllByTeacher(int teacherId);
    }
}