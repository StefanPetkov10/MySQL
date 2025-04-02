CREATE VIEW Month_Max_Payments AS
SELECT tp.month, COUNT(*) AS payment_count
FROM taxespayments tp
GROUP BY tp.month
ORDER BY payment_count DESC
LIMIT 1;

CREATE VIEW Average_Taxes AS
SELECT AVG(paymentAmount)
FROM taxespayments;

CREATE VIEW High_Payment AS
SELECT s.name, SUM(tp.paymentAmount) AS max_payment
FROM students s
JOIN taxespayments tp ON s.id = tp.student_id
GROUP BY s.id
HAVING max_payment > 2000
