using Microsoft.Extensions.Configuration;
using Capstone.Utils;
using Capstone.Repositories;
using Capstone.Models;

namespace Capstone.Repositories
{
    public class UserProfileRepository : BaseRepository, IUserProfileRepository
    {
        public UserProfileRepository(IConfiguration configuration) : base(configuration) { }

        public UserProfile GetByFirebaseId(string firebaseUserId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT up.Id, up.FirebaseId, up.FirstName, up.LastName, up.UserName, 
                               up.Email, up.ProfileImage
                          FROM UserProfile up
                         WHERE FirebaseId = @FirebaseId";

                    DbUtils.AddParameter(cmd, "@FirebaseId", firebaseUserId);

                    UserProfile userProfile = null;

                    var reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        userProfile = new UserProfile()
                        {
                            Id = DbUtils.GetInt(reader, "Id"),
                            FirebaseId = DbUtils.GetString(reader, "FirebaseId"),
                            FirstName = DbUtils.GetString(reader, "FirstName"),
                            LastName = DbUtils.GetString(reader, "LastName"),
                            UserName = DbUtils.GetString(reader, "UserName"),
                            Email = DbUtils.GetString(reader, "Email"),
                            ProfileImage = DbUtils.GetString(reader, "ProfileImage"),
                        };
                    }
                    reader.Close();

                    return userProfile;
                }
            }
        }

        public void Add(UserProfile userProfile)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"INSERT INTO UserProfile (FirebaseId, FirstName, LastName, UserName, 
                                                                 Email, ProfileImage)
                                        OUTPUT INSERTED.ID
                                        VALUES (@FirebaseId, @FirstName, @LastName, @UserName, 
                                                @Email, @ProfileImage)";
                    DbUtils.AddParameter(cmd, "@FirebaseId", userProfile.FirebaseId);
                    DbUtils.AddParameter(cmd, "@FirstName", userProfile.FirstName);
                    DbUtils.AddParameter(cmd, "@LastName", userProfile.LastName);
                    DbUtils.AddParameter(cmd, "@UserName", userProfile.UserName);
                    DbUtils.AddParameter(cmd, "@Email", userProfile.Email);
                    DbUtils.AddParameter(cmd, "@ProfileImage", userProfile.ProfileImage);

                    userProfile.Id = (int)cmd.ExecuteScalar();
                }
            }
        }

        /*
        public UserProfile GetByFirebaseUserId(string firebaseUserId)
        {
            return _context.UserProfile
                       .Include(up => up.UserType) 
                       .FirstOrDefault(up => up.FirebaseUserId == firebaseUserId);
        }

        public void Add(UserProfile userProfile)
        {
            _context.Add(userProfile);
            _context.SaveChanges();
        }
        */
    }
}
