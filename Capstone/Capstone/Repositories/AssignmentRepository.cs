using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Capstone.Models;
using Capstone.Utils;

namespace Capstone.Repositories
{
    public class AssignmentRepository : BaseRepository, IAssignmentRepository
    {
        public AssignmentRepository(IConfiguration config) : base(config) { }
        public List<Assignment> GetAllByClass(int classId)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                       SELECT a.Id, a.[Name] AS AssignmentName, a.Instructions, 
                              a.DueDate, a.ClassId,
                              c.[Name] AS ClassroomName, c.TeacherId, c.[Begin] AS FirstDay, c.[End] AS LastDay,
                               up.FirebaseId, up.FirstName, up.LastName, up.UserName, 
                               up.Email, up.ProfileImage
                         FROM Assignment a
                              LEFT JOIN Class c ON a.classId = c.id
                              LEFT JOIN UserProfile up ON c.TeacherId = up.Id
                        WHERE ClassId = @ClassId";
                    cmd.Parameters.AddWithValue("@ClassId", classId);
                    var reader = cmd.ExecuteReader();

                    var assignments = new List<Assignment>();

                    while (reader.Read())
                    {
                        assignments.Add(NewAssignmentFromReader(reader));
                    }

                    reader.Close();

                    return assignments;
                }
            }
        }

        public Assignment GetAssignment(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                       SELECT a.Id, a.[Name] AS AssignmentName, a.Instructions, 
                              a.DueDate, a.ClassId,
                              c.[Name] AS ClassroomName, c.TeacherId, c.[Begin] AS FirstDay, c.[End] AS LastDay,
                               up.FirebaseId, up.FirstName, up.LastName, up.UserName, 
                               up.Email, up.ProfileImage
                         FROM Assignment a
                              LEFT JOIN Class c ON a.classId = c.id
                              LEFT JOIN UserProfile up ON c.TeacherId = up.Id
                        WHERE a.Id = @Id";

                    cmd.Parameters.AddWithValue("@Id", id);
                    var reader = cmd.ExecuteReader();

                    Assignment assignment = null;

                    if (reader.Read())
                    {
                        assignment = NewAssignmentFromReader(reader);
                    }

                    reader.Close();

                    return assignment;
                }
            }
        }

        public void AddAssignment(Assignment assignment)
        {
            using (var conn = Connection)
            {
                conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        INSERT INTO Assignment (
                            [Name], Instructions, DueDate, ClassId )
                        OUTPUT INSERTED.ID
                        VALUES (
                            @Name, @Instructions, @DueDate, @ClassId )";


                    cmd.Parameters.AddWithValue("@Name", assignment.Name);
                    cmd.Parameters.AddWithValue("@Instructions", assignment.Instructions);
                    cmd.Parameters.AddWithValue("@DueDate", DbUtils.ValueOrDBNull(assignment.DueDate));
                    cmd.Parameters.AddWithValue("@ClassId", assignment.ClassId);

                    assignment.Id = (int)cmd.ExecuteScalar();
                }
            }
        }

        public void DeleteAssignment(int assignmentId)
        {
            using (SqlConnection conn = Connection)
            {
                conn.Open();

                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                            DELETE FROM StudentAssignment
                            WHERE AssignmentId = @id;
                            DELETE FROM Assignment
                            WHERE Id = @id
                        ";

                    cmd.Parameters.AddWithValue("@id", assignmentId);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void EditAssignment(Assignment assignment)
        {
            using (SqlConnection conn = Connection)
            {
                conn.Open();

                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                            UPDATE Assignment
                            SET 
                                [Name] = @Name, 
                                Instructions = @Instructions, 
                                DueDate = @DueDate, 
                                ClassId = @ClassId
                            WHERE Id = @id";

                    cmd.Parameters.AddWithValue("@Name", assignment.Name);
                    cmd.Parameters.AddWithValue("@Instructions", assignment.Instructions);
                    cmd.Parameters.AddWithValue("@DueDate", DbUtils.ValueOrDBNull(assignment.DueDate));
                    cmd.Parameters.AddWithValue("@ClassId", assignment.ClassId);
                    cmd.Parameters.AddWithValue("@id", assignment.Id);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        private Assignment NewAssignmentFromReader(SqlDataReader reader)
        {
            return new Assignment()
            {
                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                Name = reader.GetString(reader.GetOrdinal("AssignmentName")),
                Instructions = reader.GetString(reader.GetOrdinal("Instructions")),
                DueDate = DbUtils.GetNullableDateTime(reader, "DueDate"),
                ClassId = reader.GetInt32(reader.GetOrdinal("ClassId")),
                Class = new Class()
                {
                    Id = reader.GetInt32(reader.GetOrdinal("ClassId")),
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
                }
            };
        }
    }
}
