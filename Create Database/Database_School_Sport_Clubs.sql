CREATE DATABASE SCHOOL_SPORT_CLUBS;
USE SCHOOL_SPORT_CLUBS;

CREATE TABLE students(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
egn VARCHAR(10) NOT NULL UNIQUE,
address VARCHAR(255) NOT NULL,
phone VARCHAR(20) NULL DEFAULT NULL,
class VARCHAR(10) NULL DEFAULT NULL   
);

CREATE TABLE sportGroups(
id INT AUTO_INCREMENT PRIMARY KEY,
location VARCHAR(255) NOT NULL,
dayOfWeek ENUM('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
hourOfTraining TIME NOT NULL,
UNIQUE KEY(location,dayOfWeek,hourOfTraining)
);

CREATE TABLE student_sport(
student_id int not null,  
CONSTRAINT FOREIGN KEY (student_id) REFERENCES students(id),
sportGroup_id int not null,
CONSTRAINT FOREIGN KEY (sportGroup_id) REFERENCES sportGroups(id),
PRIMARY KEY(student_id,sportGroup_id)
);

CREATE TABLE sports(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL
);

ALTER TABLE sportGroups
ADD sport_id INT NOT NULL;

ALTER TABLE sportGroups
ADD CONSTRAINT FOREIGN KEY(sport_id) REFERENCES sports(id);

CREATE TABLE coaches(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
egn VARCHAR(10) NOT NULL UNIQUE
);

ALTER TABLE sportGroups
ADD coach_id INT;

ALTER TABLE sportGroups
ADD CONSTRAINT FOREIGN KEY (coach_id) REFERENCES coaches(id);

INSERT INTO `sports` (`name`) VALUES ('Football');
INSERT INTO `sports` (`name`) VALUES ('Volleyball');

INSERT INTO `coaches` (`name`, `egn`) 
VALUES ('Иван Петков', '7509041245'),
('Георги Иванов Тодоров', '8010091245'),
('Илиян Тодоров Георгиев', '8407106352');

INSERT INTO `students` (`name`, `egn`, `address`, `phone`, `class`) VALUES
('Александър Иванов', '0512301234', 'ул. Васил Левски 12, София', '0888123456', '10А'),
('Мария Петрова', '0605125678', 'ул. Патриарх Евтимий 8, Пловдив', '0899234567', '9Б'),
('Георги Димитров', '0411207890', 'бул. България 23, Варна', NULL, '11В'),
('Елица Стоянова', '0303083456', 'ул. Иван Вазов 15, Бургас', '0877345678', '12Г'),
('Никола Колев', '0202186543', 'ул. Христо Ботев 5, Русе', '0898567890', '8Д');

INSERT INTO `sportGroups` (`location`, `dayOfWeek`, `hourOfTraining`, `sport_id`, `coach_id`) VALUES
('Стадион Васил Левски', 'Monday', '16:00:00', 1, 1),
('Зала Олимпия', 'Wednesday', '18:30:00', 2, 2),
('Спортен комплекс Пловдив', 'Friday', '17:00:00', 1, 3),
('Зала Арена', 'Tuesday', '19:00:00', 2, 1),
('Стадион Варна', 'Thursday', '16:30:00', 1, 2);

INSERT INTO `student_sport` (`student_id`, `sportGroup_id`) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 5),
(4, 4),
(5, 1),
(5, 2);

SELECT * FROM sportGroups;

UPDATE coaches 
SET Name = 'Ванко 1'
WHERE id= 1;

UPDATE sportGroups
SET hourOfTraining = '12:00:00'
WHERE location = 'Спортен комплекс Пловдив' AND dayOfWeek = 'Friday';

SELECT NAME FROM coaches
WHERE name LIKE 'Г%' And EGN = '8010091245';

SELECT * FROM coaches


