
SELECT s.name, ss.student_id
FROM students s
LEFT JOIN student_sport ss ON s.id = ss.student_id
WHERE s.class = 10;

SELECT * 
FROM sportgroups sg
RIGHT JOIN student_sport ss ON sg.id = ss.sportGroup_id
RIGHT JOIN sports s ON s.id = sg.sport_id
WHERE s.name = 'Football';

SELECT *
FROM students s
INNER JOIN student_sport ss ON s.id = ss.student_id
INNER JOIN sportgroups sg ON sg.id = ss.sportGroup_id 
INNER JOIN coaches c ON c.id = sg.coach_id
INNER JOIN sports sp ON sp.id = sg.sport_id
WHERE s.phone IS NOT NULL;

SELECT *
FROM students s
JOIN student_sport ss ON s.id = ss.student_id
WHERE ss.sportGroup_id = (
	SELECT ss2.sportGroup_id
    FROM students s2
    JOIN student_sport ss2 ON s2.id = ss2.student_id
    WHERE s2.name = 'Iliyan Ivanov'
);

SELECT sports.name AS Sport, COUNT(student_sport.student_id) AS Student_Count
FROM sports
JOIN sportGroups ON sports.id = sportGroups.sport_id
JOIN student_sport ON sportGroups.id = student_sport.sportGroup_id
GROUP BY sports.name;

SELECT name FROM students
WHERE id IN (
    SELECT student_id FROM student_sport
    GROUP BY student_id
    HAVING COUNT(*) = (SELECT MAX(GroupCount) 
                       FROM (SELECT student_id, COUNT(*) AS GroupCount 
                             FROM student_sport GROUP BY student_id) AS Temp)
);



