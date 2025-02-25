ALTER TABLE Courses ADD COLUMN Credits_temp DECIMAL(5,2);
UPDATE Courses SET Credits_temp = Credits WHERE Credits IS NOT NULL;
ALTER TABLE Courses DROP COLUMN Credits;
ALTER TABLE Courses RENAME COLUMN Credits_temp TO Credits;

--Destructive approach: 
--Since modifying a column type directly can cause data lose,
--I create a new temporary column(Credits_temp)  with DECIMAL data type
--Copy the existing data into Credits_temp using WHERE condition to prevent unsafe updates
--DROP the old Credits column
--Rename Credits_temp back to Credits.


ALTER TABLE Courses ADD COLUMN Credits_temp DECIMAL(5,2);
UPDATE Courses SET Credits_temp = Credits WHERE Credits IS NOT NULL;
SELECT * FROM Courses;
ALTER TABLE Courses RENAME COLUMN Credits TO Credits_old;
ALTER TABLE Courses RENAME COLUMN Credits_temp TO Credits;
ALTER TABLE Courses DROP COLUMN Credits_old;

--Non-Destructive
--Instead of dropping the column immediately
--Create a new column (Credits_temp) with the DECIMAL data type
--Copy existing values to the new column.
--Keep both columns (Credits and Credits_temp) for verification.
--After a period of time DROP the old column.
