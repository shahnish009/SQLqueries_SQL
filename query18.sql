SELECT pur# FROM purchases WHERE pur# IN
(SELECT pur#, total_price FROM purchases WHERE cid = 'c006');
