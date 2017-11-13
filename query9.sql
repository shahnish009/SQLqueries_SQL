SELECT e.name FROM employees e WHERE NOT EXISTS
(SELECT pu.eid from purchases pu, products pr
WHERE pu.pid = pr.pid AND pr.original_price  >= 200 AND e.eid = pu.eid)
/

SELECT e.name FROM employees e WHERE e.eid NOT IN
(SELECT pu.eid from purchases pu, products pr
WHERE pu.pid = pr.pid AND pr.original_price  >= 200 AND e.eid = pu.eid)
/
