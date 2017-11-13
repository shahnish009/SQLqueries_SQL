(SELECT pr.pid, pr.name, count(*) AS c6 FROM products pr, purchases pu, customers c
WHERE pr.pid = pu.pid AND c.cid = pu.cid
AND to_char(ptime, 'DD-MM-YYYY') LIKE '%10-2017'
GROUP BY pr.pid, pr.name)
UNION
(SELECT pr.pid, pr.name, 0 AS c6 
FROM products pr, purchases pu, customers c
WHERE pr.pid = pu.pid AND c.cid = pu.cid
AND to_char(ptime, 'MM-YYYY')  != '10-2017'
GROUP BY pr.pid, pr.name )
/
