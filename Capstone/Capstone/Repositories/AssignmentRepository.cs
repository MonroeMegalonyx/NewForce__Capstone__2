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

        //public List<Post> GetAllPostsByUser(int userProfileId)
        //{
        //    using (var conn = Connection)
        //    {
        //        conn.Open();
        //        using (var cmd = conn.CreateCommand())
        //        {
        //            cmd.CommandText = @"
        //               SELECT p.Id, p.Title, p.Content, 
        //                      p.ImageLocation AS HeaderImage,
        //                      p.CreateDateTime, p.PublishDateTime, p.IsApproved,
        //                      p.CategoryId, p.UserProfileId,
        //                      c.[Name] AS CategoryName,
        //                      u.FirstName, u.LastName, u.DisplayName, 
        //                      u.Email, u.CreateDateTime, u.ImageLocation AS AvatarImage,
        //                      u.UserTypeId, 
        //                      ut.[Name] AS UserTypeName
        //                 FROM Post p
        //                      LEFT JOIN Category c ON p.CategoryId = c.id
        //                      LEFT JOIN UserProfile u ON p.UserProfileId = u.id
        //                      LEFT JOIN UserType ut ON u.UserTypeId = ut.id
        //                WHERE p.UserProfileId = @userProfileId";

        //            cmd.Parameters.AddWithValue("@userProfileId", userProfileId);
        //            var reader = cmd.ExecuteReader();

        //            var posts = new List<Post>();

        //            while (reader.Read())
        //            {
        //                posts.Add(NewPostFromReader(reader));
        //            }

        //            reader.Close();

        //            return posts;
        //        }
        //    }
        //}

        //public Post GetSinglePostById(int id)
        //{
        //    using (var conn = Connection)
        //    {
        //        conn.Open();
        //        using (var cmd = conn.CreateCommand())
        //        {
        //            cmd.CommandText = @"
        //               SELECT p.Id, p.Title, p.Content, 
        //                      p.ImageLocation AS HeaderImage,
        //                      p.CreateDateTime, p.PublishDateTime, p.IsApproved,
        //                      p.CategoryId, p.UserProfileId,
        //                      c.[Name] AS CategoryName,
        //                      u.FirstName, u.LastName, u.DisplayName, 
        //                      u.Email, u.CreateDateTime, u.ImageLocation AS AvatarImage,
        //                      u.UserTypeId, 
        //                      ut.[Name] AS UserTypeName
        //                 FROM Post p
        //                      LEFT JOIN Category c ON p.CategoryId = c.id
        //                      LEFT JOIN UserProfile u ON p.UserProfileId = u.id
        //                      LEFT JOIN UserType ut ON u.UserTypeId = ut.id
        //                WHERE p.id = @Id";

        //            cmd.Parameters.AddWithValue("@id", id);
        //            var reader = cmd.ExecuteReader();

        //            Post post = null;

        //            if (reader.Read())
        //            {
        //                post = NewPostFromReader(reader);
        //            }

        //            reader.Close();

        //            return post;
        //        }
        //    }
        //}

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
                            DELETE FROM Assignment
                            WHERE Id = @id
                        ";

                    cmd.Parameters.AddWithValue("@id", assignmentId);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        //public void EditPost(Post post)
        //{
        //    using (SqlConnection conn = Connection)
        //    {
        //        conn.Open();

        //        using (SqlCommand cmd = conn.CreateCommand())
        //        {
        //            cmd.CommandText = @"
        //                    UPDATE Post
        //                    SET 
        //                        Title = @title, 
        //                        Content = @content, 
        //                        CategoryId = @categoryid, 
        //                        ImageLocation = @headerimage,
        //                        PublishDateTime = @PublishDateTime
        //                    WHERE Id = @id";

        //            cmd.Parameters.AddWithValue("@title", post.Title);
        //            cmd.Parameters.AddWithValue("@content", post.Content);
        //            cmd.Parameters.AddWithValue("@categoryid", post.CategoryId);
        //            cmd.Parameters.AddWithValue("@headerimage", DbUtils.ValueOrDBNull(post.ImageLocation));
        //            cmd.Parameters.AddWithValue("@PublishDateTime", DbUtils.ValueOrDBNull(post.PublishDateTime));
        //            cmd.Parameters.AddWithValue("@id", post.Id);

        //            cmd.ExecuteNonQuery();
        //        }
        //    }
        //}

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
