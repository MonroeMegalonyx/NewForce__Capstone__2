using Capstone.Models;
using Capstone.Utils;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Repositories
{
    public class ClassRepository : BaseRepository, IClassRepository
    {
        public ClassRepository(IConfiguration configuration) : base(configuration) { }

        public List<Class> GetAllByTeacher(int teacherId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        SELECT c.Id, c.[Name] AS ClassroomName, c.TeacherId, c.[Begin] AS FirstDay, c.[End] AS LastDay,
                               up.FirebaseId, up.FirstName, up.LastName, up.UserName, 
                               up.Email, up.ProfileImage
                          FROM Class c
                               LEFT JOIN UserProfile up ON c.TeacherId = up.Id
                         WHERE TeacherId = @TeacherId";

                    cmd.Parameters.AddWithValue("@TeacherId", teacherId);
                    var reader = cmd.ExecuteReader();

                    var clasrooms = new List<Class>();
                    
                    while (reader.Read())
                    {
                        clasrooms.Add(NewClassFromReader(reader));
                    }

                    reader.Close();

                    return clasrooms;
                }
            }
        }

        private Class NewClassFromReader(SqlDataReader reader)
        {
            return new Class()
            {
                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                Name = reader.GetString(reader.GetOrdinal("ClassroomName")),
                TeacherId = reader.GetInt32(reader.GetOrdinal("TeacherId")),
                UserProfile = new UserProfile()
                {
                    Id = reader.GetInt32(reader.GetOrdinal("TeacherId")),
                    FirebaseId = DbUtils.GetString(reader, "FirebaseId"),
                    FirstName = DbUtils.GetString(reader, "FirstName"),
                    LastName = DbUtils.GetString(reader, "LastName"),
                    UserName = DbUtils.GetString(reader, "UserName"),
                    Email = DbUtils.GetString(reader, "Email"),
                    ProfileImage = DbUtils.GetNullableString(reader, "ProfileImage"),
                },
                Begin = DbUtils.GetNullableDateTime(reader, "FirstDay"),
                End = DbUtils.GetNullableDateTime(reader, "LastDay")
            };
        }
    }
}
