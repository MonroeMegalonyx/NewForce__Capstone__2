using Capstone.Models;

namespace Capstone.Repositories
{
    public interface IUserProfileRepository
    {
        void Add(UserProfile userProfile);
        UserProfile GetByFirebaseId(string firebaseId);
    }
}