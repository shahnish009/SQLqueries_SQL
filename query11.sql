SELECT pu.cid FROM purchases pu, products pr
WHERE pr.pid = pu.pid AND original_price > 200
AND to_char(ptime, 'DD-MM-YYYY') LIKE '%10-2017'
/
