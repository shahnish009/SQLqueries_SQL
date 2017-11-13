SELECT pr.pid, pr.name, count(*) AS c6 
FROM products pr LEFT OUTER JOIN purchases pu ON pr.pid = pu.pid,
customers c LEFT OUTER JOIN purchases pu ON c.cid = pu.cid 
WHERE to_char(ptime, 'DD-MM-YYYY') LIKE '%10-2017'
GROUP BY pr.pid, pr.name ORDER BY pr.pid;

