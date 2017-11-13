SELECT c.name FROM customers c WHERE c.cid IN
(SELECT pu.cid FROM purchases pu WHERE total_price = 
(SELECT MAX(total_price) FROM purchases))
/
