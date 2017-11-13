COLUMN c5 HEADING 'total amount spent'

SELECT name, c5 FROM (SELECT c.name, SUM(total_price) AS c5
FROM customers c, purchases p WHERE c.cid = p.cid
GROUP BY c.name ORDER BY SUM(total_price) DESC) WHERE rownum < 4
/
