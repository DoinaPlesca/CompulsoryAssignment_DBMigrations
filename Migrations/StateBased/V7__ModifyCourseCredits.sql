ALTER TABLE Courses ADD COLUMN Credits_temp DECIMAL(5,2);
UPDATE Courses SET Credits_temp = Credits WHERE Credits IS NOT NULL;
ALTER TABLE Courses DROP COLUMN Credits;
ALTER TABLE Courses RENAME COLUMN Credits_temp TO Credits;

--Destructive approach: since modifying a column type directly can cause data lose,
--I create a new temporary column(Credits_temp)  with DECIMAL data type
--Copy the existing data into Credits_temp using WHERE condition to prevent unsafe updates
--DROP the old Credits column
--Rename Credits_temp back to Credits.
