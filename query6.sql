SET PAGESIZE 20

SET LINESIZE 200

COLUMN c1 HEADING 'product name'

COLUMN ptime FORMAT a40

SELECT pur#, name c1, to_char(ptime, 'Month DD, YYYY Day HH:MI:SS') AS 
ptime, total_price, (original_price * qty - total_price) AS "saving"
FROM purchases pu, products pr WHERE pu.pid = pr.pid
/
