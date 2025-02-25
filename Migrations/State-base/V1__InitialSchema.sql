CREATE TABLE Students (
                          Id SERIAL PRIMARY KEY,
                          FirstName TEXT NOT NULL,
                          LastName TEXT NOT NULL,
                          Email TEXT NOT NULL,
                          EnrollmentDate TIMESTAMP NOT NULL
);
CREATE TABLE Courses (
                         Id SERIAL PRIMARY KEY,
                         Title TEXT NOT NULL,
                         Credits int NOT NULL
);
CREATE TABLE Enrollments (
                             Id SERIAL PRIMARY KEY,
                             StudentId INT NOT NULL REFERENCES Students(Id) ON DELETE CASCADE,
                             CourseId INT NOT NULL REFERENCES Courses(Id) ON DELETE CASCADE,
                             Grade TEXT NOT NULL
);
