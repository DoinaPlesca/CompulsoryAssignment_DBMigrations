CREATE TABLE Department(
    Id SERIAL PRIMARY KEY,
    Name TEXT NOT NULL,
    Budget DECIMAL(10,2) NOT NULL,
    StartDate TIMESTAMP NOT NULL,
    DepartmentHeadId int NOT NULL 
);
ALTER TABLE Department
ADD CONSTRAINT FK_DEPARTMENTS_INSTRUCTORS
FOREIGN KEY (DepartmentHeadId) REFERENCES Instructors(Id) ON DELETE CASCADE;