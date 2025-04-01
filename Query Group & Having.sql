USE school_sport_clubs;

SELECT students.name, SUM(taxespayments.paymentAmount) AS total_paid
FROM students
JOIN taxespayments ON students.id = taxespayments.student_id
GROUP BY students.name
ORDER BY total_paid DESC;

SELECT sports.name, COUNT(sportGroups.id) AS group_count
FROM sports
JOIN sportgroups ON sports.id = sportgroups.sport_id
GROUP BY sports.name
HAVING COUNT(sportGroups.id) > 1;

SELECT coaches.name, COUNT(sportGroups.id) AS group_count
FROM coaches
JOIN sportgroups ON coaches.id = sportgroups.coach_id
GROUP BY coaches.name
HAVING COUNT(sportGroups.id) > 1;

SELECT students.name, COUNT(student_sport.sportGroup_id) AS group_count
FROM students
JOIN student_sport ON students.id = student_sport.student_id
GROUP BY students.name
HAVING COUNT(student_sport.sportGroup_id) >= 2;

SELECT students.name, COUNT(DISTINCT taxespayments.month) AS months_paid
FROM students
JOIN taxespayments ON students.id = taxespayments.student_id
GROUP BY students.name
HAVING COUNT(DISTINCT taxespayments.month) >= 10
ORDER BY months_paid DESC;

SELECT students.name, SUM(taxespayments.paymentAmount) AS total_paid
FROM students
JOIN taxespayments ON students.id = taxespayments.student_id
WHERE taxespayments.year = 2015
GROUP BY students.name
ORDER BY total_paid DESC
LIMIT 5;

SELECT coaches.name, SUM(salarypayments.salaryAmount) AS total_salary
FROM coaches
JOIN salarypayments ON coaches.id = salarypayments.coach_id
WHERE salarypayments.year = 2015
GROUP BY coaches.name
HAVING SUM(salarypayments.salaryAmount) > 2000;

SELECT sports.name, COUNT(sportGroups.id) AS group_count
FROM sports
JOIN sportgroups ON sports.id = sportgroups.sport_id
GROUP BY sports.name
HAVING COUNT(sportGroups.id) > 2;

SELECT students.name, AVG(taxespayments.paymentAmount) AS studetn_taxes
FROM students
JOIN taxespayments ON students.id = taxespayments.student_id
GROUP BY students.name
ORDER BY AVG(taxespayments.paymentAmount) DESC;

SELECT sports.name, COUNT(sportGroups.id) AS students_count
FROM sports
JOIN sportgroups ON sports.id = sportgroups.sport_id
JOIN student_sport ON sportgroups.id = student_sport.sportGroup_id
GROUP BY(sports.name);

SELECT sportGroups.id, COUNT(student_sport.student_id) AS student_count
FROM sportGroups
JOIN student_sport ON sportGroups.id = student_sport.sportGroup_id
GROUP BY sportGroups.id
HAVING COUNT(student_sport.student_id) >= 3;

