SELECT c.name, telephone# FROM customers c, purchases p
WHERE c.cid = p.cid AND total_price >= 100
AND to_char(ptime, 'DD-MON-YY') LIKE '%OCT-17'
/
