namespace StudentManagementSystem.DataModels;

public class Enrollment
{
    public int Id { get; set; }
    public int StudentId { get; set; }
    public int CourseId { get; set; }
    public string FinalGrade { get; set; } 
    public Student Student { get; set; }
    public Course Course { get; set; }
    
}