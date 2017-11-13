SELECT pur#, original_price * qty - total_price AS saving
FROM purchases pu, products pr WHERE pr.pid = pu.pid AND pur# IN
(SELECT pur# FROM purchases WHERE original_price * qty - total_price =
(SELECT MAX(original_price * qty - total_price) FROM purchases pu,
products pr WHERE pu.pid = pr.pid)) ORDER BY saving DESC
/
