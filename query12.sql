SELECT e.eid, e.name FROM employees e WHERE e.eid IN
(SELECT pu.eid FROM purchases pu, customers c
WHERE pu.cid = c.cid AND c.cid IN
(SELECT DISTINCT c.cid FROM customers c, products pr, purchases pu
WHERE pu.cid = c.cid AND pu.pid = pr.pid AND pr.name IN ('camera', 'chair')))
/
