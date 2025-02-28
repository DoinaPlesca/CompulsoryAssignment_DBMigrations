# CompulsoryAssignment_DBMigrations


# **Student Management**

## **Project Overview**

The Student Management project is a .NET Console application that demonstrates the use of Entity Framework Core (EF Core) to manage student enrollments in courses.
The project includes a relational data model with Students, Courses, and Enrollments and supports database migrations using EF Code-First and State-based migration approaches.

### Setup Entity Framework Core

**Install EF Core Packages**

To set up EF Core in the project, install the following packages:

`dotnet add package Microsoft.EntityFrameworkCore`     

`dotnet add package Microsoft.EntityFrameworkCore.PostgreSQL`

`dotnet add package Microsoft.EntityFrameworkCorr.Tools`

### Define Data Model

The project uses the following entity classes to represent the schema:

**Student Entity**
* Student
* Id
* FirstName
* LastName
* Email
* EnrollmentDate


**Course Entity**

* Course
* Id
* Title
* Credits

**Enrollment Entity**

* Id
* StudentId
* CourseId
* Grade


### Create the Database Context

The SchoolContext class manages the database connection and entity mappings.

## Migration Approaches Overview

The project implements two migration strategies:

### 1. EF Code-First (Change-based)

1. [ ] Modify model classes.
3. [ ] Generate incremental migration files using EF CLI.
5. [ ] Produce migration artifacts (SQL scripts).



### 2. State-based

1. [ ] Write SQL migration scripts describing the final state of the schema.
3. [ ] Maintain a snapshot rather than incremental changes.
5. [ ] Each migration is managed in a separate Git branch.



## Git Branching Strategy for Migrations

![img_5.png](img_5.png)


## 1.  **Generating Migrations**

On the _feat/initial-schema-ef_ branch, generate the initial migration:

[dotnet ef migrations add InitialCreate]()

This generates a migration file in the Migrations folder.



To generate an SQL script artifact from the migration:

[dotnet ef migrations script -o Migrations/V1__InitialCreate.sql]()

For apply pending migrations to the database run:
[dotnet ef database update]()


## 2. Migration: AddMiddleNameToStudent

On the _feat/add-middle-name-ef_ branch, generate the migration to add a MiddleName column to the Students table:

[dotnet ef migrations add AddMiddleNameToStudent]()

To generate an SQL script artifact for the AddMiddleNameToStudent migration:

[dotnet ef migrations script InitialCreate AddMiddleNameToStudent -o Migrations/V2__AddMiddleName.sql]()

## 3. Migration: AddDateOfBirth

On the feat/add-dob-ef branch, generate the migration to add DateOfBirth column to the Students table:

[dotnet ef migrations add AddDateOfBirthToStudent]()

To generate an SQL script artifact for the AddDateOfBirthToStudent migration:

[dotnet ef migrations script AddMiddleNameToStudent AddDateOfBirthToStudent -o Migrations/V3__AddDateOfBirth.sql]()

## 4.  Migration: AddInstructor

Create the Instructor Model:
* Id
* FirstName
* LastName
* Email
* HireDate

Update the Course Model:
In Course.cs, add the foreign key and navigation property:
* InstructorId
* Instructor

Update DbContext:
In SchoolContext.cs, add:

[public DbSet<Instructor> Instructors { get; set; }]()

On branch _feat/add-instructor-ef_, run the migration:

[dotnet ef migrations add AddInstructorRelation]()

Create SQL Artifact for Migration:

[dotnet ef migrations script AddDateOfBirthToStudent AddInstructorRelation -o Migrations/V4__AddInstructorRelation.sql]()

Update Db: [dotnet ef database update]()


## 5.  Migration: RenameGradeToFinalGrade

On the _feat/rename-grade-ef_ branch, generate the migration to rename Grade to FinalGrade in the Enrollments table:

[dotnet ef migrations add RenameGradeToFinalGrade]()

Create SQL Artifact for Migration:

[dotnet ef migrations script AddInstructorRelation RenameGradeToFinalGrade -o Migrations/V5__RenameGradeToFinalGrade.sql]()

## **## Destructive vs Non-Destructive Approach**
Why a Destructive Approach?

Since the project is still in its initial stage and there is no data in the database, I chose a destructive approach. At this stage, we can afford to rename or drop columns without concerns about data loss or breaking functionality.

However, when the project moves into active development and contains critical data, we must follow a non-destructive approach to ensure backward compatibility. In the state-based migration strategy I implemented before, I used both destructive and non-destructive approaches depending on the project's phase and requirements.


**_Why I Chose a Destructive Approach?_**

_1. Renaming a Column in PostgreSQL Is Safe_

PostgreSQL supports ALTER TABLE ... RENAME COLUMN as an atomic operation, meaning it happens instantly without affecting data integrity.

_2. No Data Loss Occurs_

The ALTER TABLE ... RENAME COLUMN command preserves all existing data in the column.

_3. _Immediate Codebase Updates Are Possible__

If the application code is updated at the same time as the migration, there’s no risk of breaking functionality.

_4. _Minimizes Complexity__

Adding a new column, copying data, dropping the old one is unnecessary since we do not need to keep both names.

## 6. Migration: AddDepartment

Create the Department Model:

*  Id 
* Name 
* Budget 
* StartDate
* DepartmentHeadId
* DepartmentHead 

Update DbContext:

[public DbSet<Department> Departments { get; set; }]()

On the _feat/add-department-ef_ branch, generate the migration to add the Department entity and its relationship with Instructor:

[dotnet ef migrations add AddDepartmentRelation]()

To generate an SQL script artifact for the AddDepartmentRelation migration run:

[dotnet ef migrations script RenameGradeToFinalGrade AddDepartmentRelation -o Migrations/V6__AddDepartmentRelation.sql]()


## 7. Migration: ModifyCourseCredits

On the _feat/modify-credits-ef_ branch, generate the migration to change the Credits column type from int to decimal(5,2):

[dotnet ef migrations add ModifyCourseCredits]()

To generate an SQL script artifact for the ModifyCourseCredits migration:

[dotnet ef migrations script AddDepartmentRelation ModifyCourseCredits -o Migrations/V7__ModifyCourseCredits.sql]()

I used a destructive approach:

1. Create a new temporary column Credits_temp.
2. Copy existing data to the new column.
3. Drop the old column Credits.
4. Rename Credits_temp to Credits.


# State-Based Migration Strategy

For state-based migrations, I follow the same branching strategy, creating a separate branch for each migration and merging them into main.

For the last migration _ModifyCourseCredits_, both destructive and non-destructive approaches were implemented:

_Destructive Approach_: Directly altered the column type, which could lead to data loss.

_Non-Destructive Approach_: Used a temporary column to migrate data safely before renaming it back to the original column name.
