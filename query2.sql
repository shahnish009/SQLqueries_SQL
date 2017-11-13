SELECT name, telephone# FROM customers c, purchases p
WHERE c.cid = p.cid AND to_char(ptime, 'DD-MON-YY') LIKE '%OCT-17'
AND telephone# LIKE '666%'
/
