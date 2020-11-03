--#1.Creating Database School
CREATE DATABASE SCHOOL

USE SCHOOL

--#2.Creating Classes table
CREATE TABLE Classes (
	Class_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Class_Name VARCHAR(50) NOT NULL
);

--#3.Creating Student table
CREATE TABLE Student (
	Student_ID INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	Student_Name VARCHAR(50) NOT NULL,
	Class_ID INT,
	Instructor_ID INT
);

--#4.Creating Instructor table
CREATE TABLE Instructor (
	Instructor_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Instructor_Name VARCHAR(50) NOT NULL
);

--#5.Adding foreign key in student table
ALTER TABLE Student
ADD CONSTRAINT fk_Class_ID FOREIGN KEY(Class_ID) REFERENCES Classes(Class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_Instructor_ID FOREIGN KEY(Instructor_ID) REFERENCES Instructor(Instructor_ID) ON UPDATE CASCADE ON DELETE CASCADE
;
--#6.Inserting records in classes table
INSERT INTO Classes (Class_Name)
	VALUES
	('Software Developer Boot Camp'),
	('C# Boot Camp')
;
--#7.Inserting records in instructor table
INSERT INTO Instructor(Instructor_Name)
	VALUES
	('Mark Zuckerberg'),
	('Elon Musk')
;
--#8.Inserting records in student table
INSERT INTO Student(Student_Name)
	VALUES
	('Mark Thomas'),
	('Dominic Sanchez'),
	('Andre Miller'),
	('Michael Roose'),
	('Christopher Mendez'),
	('Lucas Con')
;

SELECT * FROM Classes
SELECT * FROM Student
SELECT * FROM Instructor

--#9-#10.Modifying records by adding Class_ID and Instructor_ID on each student records
UPDATE Student
SET Class_ID = 1, Instructor_ID = 1
WHERE Student_ID < 1003

--#9-#10.Modifying records by adding Class_ID and Instructor_ID on each student records
UPDATE Student
SET Class_ID = 2, Instructor_ID = 2
WHERE STUDENT_ID > 1002;

--#11.Display Instructor_Name
SELECT Instructor_Name FROM Instructor;

--#12.Display Student_Name
SELECT Student_Name FROM Student
ORDER BY Student_Name;

--#13.Display all classes with student and instructor
SELECT
	Classes.Class_Name,
	Student.Student_Name,
	Instructor.Instructor_Name
FROM Classes
	JOIN Student ON Student.Class_ID = Classes.Class_ID
	JOIN Instructor ON Instructor.Instructor_ID = Student.Instructor_ID
;


