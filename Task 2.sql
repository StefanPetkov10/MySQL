CREATE DATABASE ProgrammingCourses;
USE ProgrammingCourses;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Class VARCHAR(50)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

CREATE TABLE CourseGroups (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    GroupName VARCHAR(50),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE CourseSchedule (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    CourseID INT,
    GroupID INT,
    DayOfWeek VARCHAR(10),
    StartTime TIME,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (GroupID) REFERENCES CourseGroups(GroupID)
);

CREATE TABLE StudentGroups (
    StudentGroupID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    GroupID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (GroupID) REFERENCES CourseGroups(GroupID)
);

INSERT INTO Students (FirstName, LastName, Class) VALUES
('Иван', 'Иванов', '10A'),
('Мария', 'Петрова', '10B'),
('Петър', 'Стоянов', '11A');

INSERT INTO Instructors (FirstName, LastName) VALUES
('Елена', 'Петрова'),
('Георги', 'Георгиев'),
('Анна', 'Иванова');

INSERT INTO Courses (CourseName, InstructorID) VALUES
('Web разработка', 1),
('Python за начинаещи', 2),
('JavaScript за напреднали', 3);

INSERT INTO CourseGroups (CourseID, GroupName) VALUES
(1, 'Група 1'),
(1, 'Група 2'),
(2, 'Група 1');

INSERT INTO CourseSchedule (CourseID, GroupID, DayOfWeek, StartTime) VALUES
(1, 1, 'Петък', '14:00'),
(1, 2, 'Сряда', '16:00'),
(2, 3, 'Петък', '14:00');

INSERT INTO StudentGroups (StudentID, GroupID) VALUES
(1, 1),
(2, 1),
(3, 3);

SELECT s.FirstName, s.LastName, s.Class, sg.GroupID
FROM Students s
JOIN StudentGroups sg ON s.StudentID = sg.StudentID
JOIN CourseSchedule cs ON sg.GroupID = cs.GroupID
JOIN Courses c ON cs.CourseID = c.CourseID
JOIN Instructors i ON c.InstructorID = i.InstructorID
WHERE cs.DayOfWeek = 'Петък' 
AND cs.StartTime = '14:00'
AND i.FirstName = 'Елена' 
AND i.LastName = 'Петрова'
AND c.CourseName = 'Web разработка';