SELECT pr.pid, name FROM products pr, purchases pu
WHERE pr.pid = pu.pid AND (original_price * (1 - discnt_rate)) < 10
AND (to_char(ptime, 'DD-MON-YY') LIKE '%AUG-17' OR to_char(ptime, 'DD-MON-YY') LIKE '%SEP-17')
/
