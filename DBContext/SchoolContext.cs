using DotNetEnv;
using Microsoft.EntityFrameworkCore;
using StudentManagementSystem.DataModels;

namespace StudentManagementSystem.DBContext;

public class SchoolContext : DbContext
{
    public DbSet<Course> Courses { get; set; }
    public DbSet<Student> Students { get; set; }
    public DbSet<Enrollment> Enrollments { get; set; }
    public DbSet<Instructor> Instructors { get; set; }


    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        Env.Load();
        
        var user = Environment.GetEnvironmentVariable("DB_USER");
        var database = Environment.GetEnvironmentVariable("DB_DATABASE");
        var password = Environment.GetEnvironmentVariable("DB_PASSWORD");
        var port = Environment.GetEnvironmentVariable("DB_PORT");
        var host = Environment.GetEnvironmentVariable("DB_HOST");
        
        var connectionString = $"Host={host};Port={port};Database={database};Username={user};Password={password}";

        optionsBuilder.UseNpgsql(connectionString);
    }
}