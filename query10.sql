SELECT cid, name FROM customers c WHERE NOT EXISTS
(SELECT * FROM products p WHERE pid IN
(SELECT pid FROM purchases WHERE cid = 'c005') AND NOT EXISTS
(SELECT * FROM purchases WHERE cid = c.cid AND pid = p.pid))
/
