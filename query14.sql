COLUMN c2 HEADING 'discount amount'

SELECT * FROM (SELECT pid, name, original_price * discnt_rate AS c2
FROM products ORDER BY c2 DESC) WHERE rownum <=1
/
