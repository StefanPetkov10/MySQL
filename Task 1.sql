CREATE DATABASE SchoolSports;
USE SchoolSports;

CREATE TABLE Students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    class VARCHAR(10)
);

CREATE TABLE Coaches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE Sports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sport_name VARCHAR(50)
);

CREATE TABLE TrainingGroups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sport_id INT,
    coach_id INT,
    FOREIGN KEY (sport_id) REFERENCES Sports(id),
    FOREIGN KEY (coach_id) REFERENCES Coaches(id)
);

CREATE TABLE TrainingSchedule (
    id INT AUTO_INCREMENT PRIMARY KEY,
    group_id INT,
    training_day VARCHAR(20),
    training_time TIME,
    FOREIGN KEY (group_id) REFERENCES TrainingGroups(id)
);

CREATE TABLE StudentGroups (
    student_id INT,
    group_id INT,
    PRIMARY KEY (student_id, group_id),
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (group_id) REFERENCES TrainingGroups(id)
);

INSERT INTO Students (first_name, last_name, class) VALUES
('Иван', 'Иванов', '10А'),
('Мария', 'Петрова', '9Б'),
('Георги', 'Димитров', '11В');

INSERT INTO Coaches (first_name, last_name) VALUES
('Иван', 'Петров'),
('Петър', 'Стоянов'),
('Мария', 'Георгиева');

INSERT INTO Sports (sport_name) VALUES
('Футбол'),
('Баскетбол'),
('Волейбол');

INSERT INTO TrainingGroups (sport_id, coach_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO TrainingSchedule (group_id, training_day, training_time) VALUES
(1, 'Понеделник', '08:00:00'),
(2, 'Вторник', '10:00:00'),
(3, 'Сряда', '15:00:00');

INSERT INTO StudentGroups (student_id, group_id) VALUES
(1, 1),
(2, 1),
(3, 2);

SELECT s.first_name, s.last_name, s.class, sg.group_id
FROM Students s
JOIN StudentGroups sg ON s.id = sg.student_id
JOIN TrainingGroups tg ON sg.group_id = tg.id
JOIN Coaches c ON tg.coach_id = c.id
JOIN Sports sp ON tg.sport_id = sp.id
JOIN TrainingSchedule ts ON tg.id = ts.group_id
WHERE ts.training_day = 'Понеделник'
AND ts.training_time = '08:00:00'
AND c.first_name = 'Иван' AND c.last_name = 'Петров'
AND sp.sport_name = 'Футбол';