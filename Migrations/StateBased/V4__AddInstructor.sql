-- Create Instructors Table
CREATE TABLE Instructors (
                             Id SERIAL PRIMARY KEY,
                             FirstName TEXT NOT NULL,
                             LastName TEXT NOT NULL,
                             Email TEXT NOT NULL,
                             HireDate TIMESTAMP NOT NULL
);

ALTER TABLE Courses ADD COLUMN InstructorId INT NOT NULL DEFAULT 0;
ALTER TABLE Courses ADD CONSTRAINT FK_Courses_Instructors
    FOREIGN KEY (InstructorId) REFERENCES Instructors(Id) ON DELETE CASCADE;
