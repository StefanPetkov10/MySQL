USE CinemaDB;

SELECT t.name AS theater_name, s.screen_no, sh.time
FROM Shows sh
JOIN Screens s ON sh.screen_id = s.id
JOIN Theaters t ON s.theater_id = t.id
JOIN Movies m ON sh.movie_id = m.id
WHERE m.name = 'Fast and Furious 7' 
AND s.type IN ('VIP', 'deluxe')
ORDER BY t.name ASC, s.screen_no ASC;

SELECT SUM(sh.visitors) AS sum_visitors
FROM Shows sh
JOIN Screens s ON sh.screen_id = s.id
JOIN Theaters t ON s.theater_id = t.id
JOIN Movies m ON sh.movie_id = m.id
WHERE m.name = 'Fast and Furious 7'
AND s.type = 'VIP'
AND t.name = 'Arena Mladost';



