COLUMN c3 HEADING 'Total Sale'

SELECT to_char(ptime, 'YYYY/MM') AS Month, SUM(total_price) AS c3
FROM purchases
GROUP BY to_char(ptime, 'YYYY/MM') ORDER BY Month
/
