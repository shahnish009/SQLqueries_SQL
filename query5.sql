SELECT pu.pur#, pu.eid, pu.pid, pu.cid, pu.ptime, pu.qty, pu.total_price
FROM purchases pu, customers c, products pr, employees e
WHERE pu.cid = c.cid AND pu.pid = pr.pid AND pu.eid = e.eid
AND c.name LIKE 'K%' AND pr.original_price < 15 AND e.telephone# LIKE '888%'
/
