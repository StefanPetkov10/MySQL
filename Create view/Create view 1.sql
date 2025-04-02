Use school_sport_clubs;

CREATE VIEW Football_Students AS
SELECT s.id, s.name
FROM Students s
JOIN student_sport ss ON s.id = ss.student_id
JOIN sportgroups sg ON ss.sportGroup_id = sg.id
JOIN sports sp ON sp.id = sg.sport_id
WHERE sp.name = 'Football';

CREATE VIEW Coachs_Groups AS
SELECT c.name AS Coach_name, s.name AS Sport_name
FROM coaches c
JOIN sportgroups sp ON c.id = sp.coach_id
JOIN sports s ON s.id = sp.sport_id;

CREATE VIEW Sports_Groups AS
SELECT sp.name, COUNT(DISTINCT ss.student_id)
FROM sports sp
JOIN sportgroups sg ON sg.sport_id = sp.id
JOIN student_sport ss ON ss.sportGroup_id = sg.id
JOIN students s ON s.id = ss.student_id
GROUP BY sp.name;

CREATE VIEW Sudents_WIthout_Sport AS
SELECT *
FROM students s
LEFT JOIN student_sport sp ON s.id = sp.student_id
WHERE sp.student_id IS NULL