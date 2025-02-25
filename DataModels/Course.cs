namespace StudentManagementSystem.DataModels;

public class Course
{
    public int Id { get; set; }
    public string Title { get; set; }
    public int Credits { get; set; }
    
    //TODO for future migration (when adding Instructor FK)
    
    // public int InstructorId { get; set; }
    // public Instructor Instructor { get; set; }

    public ICollection<Enrollment> Enrollments { get; set; }
}
    
