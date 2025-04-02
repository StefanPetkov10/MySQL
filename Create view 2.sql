CREATE VIEW Student_Toatal_Payments AS
SELECT s.name, SUM(tp.paymentAmount)
FROM students s
JOIN taxespayments tp ON s.id = tp.student_id
GROUP BY s.id;

CREATE VIEW Group_Payments_2015 AS
SELECT sp.name, SUM(tp.paymentAmount)
FROM taxespayments tp
JOIN sportgroups sg ON sg.id = tp.group_id
JOIN sports sp ON sp.id = sg.sport_id
WHERE tp.year = 2015
GROUP BY sg.id;

CREATE VIEW Total_Coach_Salaries AS
SELECT c.name, SUM(sp.salaryAmount)
FROM coaches c
JOIN salarypayments sp ON sp.coach_id = c.id
WHERE sp.year = 2024
GROUP BY sp.coach_id 