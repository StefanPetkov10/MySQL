
begin;

INSERT INTO Payments (student_id, month, amount) VALUES (1, 'January', 100.00);
INSERT INTO Payments (student_id, month, amount) VALUES (1, 'February', 100.00);
INSERT INTO Payments (student_id, month, amount) VALUES (1, 'March', 100.00);

COMMIT;

ROLLBACK;

---------------------------------------

CREATE TABLE IF NOT EXISTS Coaches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Groupes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    coach_id INT,
    scheduled_time DATETIME NOT NULL,
    FOREIGN KEY (coach_id) REFERENCES Coaches(id)
);


begin;

SELECT * FROM Groupes WHERE coach_id = 1 AND scheduled_time = '2025-04-04 10:00:00';

INSERT INTO Groupes (name, scheduled_time) VALUES ('Group B', '2025-04-04 10:00:00');

COMMIT;

ROLLBACK;

---------------------------------------

begin;

INSERT INTO taxespayments (student_id, group_id, paymentAmount, month, year, dateOfPayment) VALUES (2, '1', 120.00, 2, 2025, '2025-03-20 16:59:09');
INSERT INTO taxespayments (student_id, group_id, paymentAmount, month, year, dateOfPayment) VALUES (2, '1', 120.00, 3, 2025, '2025-03-20 16:59:09');

SAVEPOINT before_may_payment;

ROLLBACK TO before_may_payment;

COMMIT;

----------------------------------------

BEGIN;

DELETE FROM student_sport ss
WHERE ss.student_id = 1 AND ss.sportGroup_id = 1;

SAVEPOINT after_remove;

INSERT INTO student_sport (student_id, sportGroup_id) 
VALUES (1, 4);

ROLLBACK TO after_remove;

COMMIT;
