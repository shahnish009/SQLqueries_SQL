SELECT c.name FROM customers c, products pr, purchases pu
WHERE c.cid = pu.cid AND pu.pid = pr.pid
AND original_price * (1 - discnt_rate) <= 100 AND visits_made >= 2
AND to_char(last_visit_date, 'DDMMYYYY') = to_char(ptime, 'DDMMYYYY')
/
