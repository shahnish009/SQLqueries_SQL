COLUMN c4 HEADING 'total quantity sold'

SELECT pr.pid, pr.name, SUM(pu.qty) AS c4 FROM products pr, purchases pu
WHERE pr.pid = pu.pid AND pr.pid IN
(SELECT pid FROM purchases WHERE qty = 
(SELECT MAX(qty) FROM purchases)) GROUP BY pr.pid, pr.name;
