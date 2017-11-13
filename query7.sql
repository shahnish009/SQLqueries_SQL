SELECT e.eid FROM employees e, customers c
WHERE substr(e.telephone#, 0, 3) = substr(c.telephone#, 0, 3)
GROUP BY e.eid ORDER BY e.eid
/
