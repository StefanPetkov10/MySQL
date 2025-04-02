CREATE VIEW Students_group_count AS
SELECT s.id, s.name, COUNT(ss.sportGroup_id)
FROM students s
JOIN student_sport ss ON s.id = ss.student_id
GROUP BY s.id;

CREATE VIEW Groups_day_hour AS
SELECT *
FROM sportgroups sg1
JOIN sportgroups sg2 ON sg1.dayOfWeek = sg2.dayOfWeek
AND sg1.hourOfTraining = sg2.hourOfTraining
AND sg1 != sg2;


CREATE VIEW students_multiple_sports AS
SELECT s.name, COUNT(sports.id)
FROM students s
JOIN student_sport sp ON sp.student_id = s.id
JOIN sportgroups sg ON sg.sport_id = sp.sportGroup_id
JOIN sports sports ON sports.id = sg.sport_id
WHERE s.class = '11'
GROUP BY s.id

