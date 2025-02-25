namespace StudentManagementSystem.DataModels;

public class Enrollment
{
    public int Id { get; set; }
    public int StudentId { get; set; }
    public int CourseId { get; set; }
    
    public string Grade { get; set; } // TODO  rename to FinalGrade in a later migration
    
    public Student Student { get; set; }
    public Course Course { get; set; }
    
}