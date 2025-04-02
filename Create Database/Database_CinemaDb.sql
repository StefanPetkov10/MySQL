CREATE DATABASE CinemaDB;
USE CinemaDB;

CREATE TABLE Theaters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE Movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    year YEAR NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE Screens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    theater_id INT NOT NULL,
    screen_no INT NOT NULL, 
    type ENUM('normal', 'deluxe', 'VIP') NOT NULL,
    CONSTRAINT fk_screen_theater FOREIGN KEY (theater_id) REFERENCES Theaters(id),
    UNIQUE (theater_id, screen_no) 
);

CREATE TABLE Shows (
    id INT AUTO_INCREMENT PRIMARY KEY,
    screen_id INT NOT NULL,
    movie_id INT NOT NULL,
    time DATETIME NOT NULL,
    visitors INT, 
    CONSTRAINT fk_show_screen FOREIGN KEY (screen_id) REFERENCES Screens(id),
    CONSTRAINT fk_show_movie FOREIGN KEY (movie_id) REFERENCES Movies(id)
);


INSERT INTO Theaters (name, city) VALUES
('Cinema City', 'Sofia'),
('Arena', 'Plovdiv');

INSERT INTO Screens (theater_id, screen_no, type) VALUES
(1, 1, 'normal'),
(1, 2, 'VIP'),
(2, 1, 'deluxe');


INSERT INTO Movies (name, year, country) VALUES
('Inception', 2010, 'USA'),
('Parasite', 2019, 'South Korea'),
('Fast and Furious 7', 2015, 'USA');

INSERT INTO Shows (screen_id, movie_id, time, visitors) VALUES
(1, 1, '2025-04-01 19:00:00', 150),
(2, 2, '2025-04-02 21:00:00', 80),
(3, 3, '2025-04-01 19:00:00', 140);


