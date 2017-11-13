SQL> start query1
SQL> SELECT pid, name FROM products
  2  WHERE discnt_rate > 0.1 AND (qoh - 10) >= qoh_threshold
  3  /

PID  NAME                                                                       
---- ---------------                                                            
p003 camera                                                                     
p007 tablet                                                                     

SQL> start query2
SQL> SELECT name, telephone# FROM customers c, purchases p
  2  WHERE c.cid = p.cid AND to_char(ptime, 'DD-MON-YY') LIKE '%OCT-17'
  3  AND telephone# LIKE '666%'
  4  /

NAME            TELEPHONE#                                                      
--------------- ------------                                                    
Kathy           666-555-4567                                                    
Joe             666-555-5746                                                    

SQL> start query3
SQL> SELECT c.name, telephone# FROM customers c, purchases p
  2  WHERE c.cid = p.cid AND total_price >= 100
  3  AND to_char(ptime, 'DD-MON-YY') LIKE '%OCT-17'
  4  /

NAME            TELEPHONE#                                                      
--------------- ------------                                                    
Kathy           666-555-4567                                                    
Mike            999-555-5674                                                    
Joe             666-555-5746                                                    

SQL> start query4
SQL> SELECT pr.pid, name FROM products pr, purchases pu
  2  WHERE pr.pid = pu.pid AND (original_price * (1 - discnt_rate)) < 10
  3  AND (to_char(ptime, 'DD-MON-YY') LIKE '%AUG-17' OR to_char(ptime, 'DD-MON-YY') LIKE '%SEP-17')
  4  /

PID  NAME                                                                       
---- ---------------                                                            
p005 chair                                                                      

SQL> start query5
SQL> SELECT pu.pur#, pu.eid, pu.pid, pu.cid, pu.ptime, pu.qty, pu.total_price
  2  FROM purchases pu, customers c, products pr, employees e
  3  WHERE pu.cid = c.cid AND pu.pid = pr.pid AND pu.eid = e.eid
  4  AND c.name LIKE 'K%' AND pr.original_price < 15 AND e.telephone# LIKE '888%'
  5  /

      PUR# EID PID  CID  PTIME            QTY TOTAL_PRICE                       
---------- --- ---- ---- --------- ---------- -----------                       
    100009 e03 p001 c007 12-OCT-17          1        8.99                       

SQL> start query6
SQL> SET PAGESIZE 20
SQL> 
SQL> SET LINESIZE 200
SQL> 
SQL> COLUMN c1 HEADING 'product name'
SQL> 
SQL> COLUMN ptime FORMAT a40
SQL> 
SQL> SELECT pur#, name c1, to_char(ptime, 'Month DD, YYYY Day HH:MI:SS') AS
  2  ptime, total_price, (original_price * qty - total_price) AS "saving"
  3  FROM purchases pu, products pr WHERE pu.pid = pr.pid
  4  /

      PUR# product name    PTIME                                    TOTAL_PRICE     saving                                                                                                              
---------- --------------- ---------------------------------------- ----------- ----------                                                                                                              
    100009 stapler         October   12, 2017 Thursday  02:44:23           8.99          1                                                                                                              
    100001 TV              August    12, 2017 Saturday  10:34:30         211.65      37.35                                                                                                              
    100010 TV              September 19, 2017 Tuesday   05:32:37         211.65      37.35                                                                                                              
    100002 camera          September 20, 2017 Wednesday 11:23:36          118.4       29.6                                                                                                              
    100003 pencil          October   08, 2017 Sunday    09:30:50           4.95          0                                                                                                              
    100011 pencil          October   16, 2017 Monday    04:54:40            9.9          0                                                                                                              
    100004 chair           August    23, 2017 Wednesday 04:23:35          18.17       7.79                                                                                                              
    100008 lamp            August    16, 2017 Wednesday 12:22:15          17.96       1.99                                                                                                              
    100007 lamp            September 10, 2017 Sunday    05:12:20          35.91       3.99                                                                                                              
    100013 lamp            August    30, 2017 Wednesday 10:38:25          35.91       3.99                                                                                                              
    100005 tablet          October   15, 2017 Sunday    01:38:55          119.2       29.8                                                                                                              
    100012 computer        September 18, 2017 Monday    03:56:38          698.6      299.4                                                                                                              
    100006 computer        October   12, 2017 Thursday  03:22:10          349.3      149.7                                                                                                              
    100014 powerbank       October   14, 2017 Saturday  10:54:06         134.84      15.01                                                                                                              

14 rows selected.

SQL> start query7
SQL> SELECT e.eid FROM employees e, customers c
  2  WHERE substr(e.telephone#, 0, 3) = substr(c.telephone#, 0, 3)
  3  GROUP BY e.eid ORDER BY e.eid
  4  /

EID                                                                                                                                                                                                     
---                                                                                                                                                                                                     
e01                                                                                                                                                                                                     
e02                                                                                                                                                                                                     
e03                                                                                                                                                                                                     
e04                                                                                                                                                                                                     

SQL> start query8
SQL> SELECT c.name FROM customers c, products pr, purchases pu
  2  WHERE c.cid = pu.cid AND pu.pid = pr.pid
  3  AND original_price * (1 - discnt_rate) <= 100 AND visits_made >= 2
  4  AND to_char(last_visit_date, 'DDMMYYYY') = to_char(ptime, 'DDMMYYYY')
  5  /

NAME                                                                                                                                                                                                    
---------------                                                                                                                                                                                         
Connie                                                                                                                                                                                                  
Mike                                                                                                                                                                                                    

SQL> start query9
SQL> SELECT e.name FROM employees e WHERE NOT EXISTS
  2  (SELECT pu.eid from purchases pu, products pr
  3  WHERE pu.pid = pr.pid AND pr.original_price  >= 200 AND e.eid = pu.eid)
  4  /

NAME                                                                                                                                                                                                    
---------------                                                                                                                                                                                         
Mike                                                                                                                                                                                                    

SQL> 
SQL> SELECT e.name FROM employees e WHERE e.eid NOT IN
  2  (SELECT pu.eid from purchases pu, products pr
  3  WHERE pu.pid = pr.pid AND pr.original_price  >= 200 AND e.eid = pu.eid)
  4  /

NAME                                                                                                                                                                                                    
---------------                                                                                                                                                                                         
Mike                                                                                                                                                                                                    

SQL> start query10
SQL> SELECT cid, name FROM customers c WHERE NOT EXISTS
  2  (SELECT * FROM products p WHERE pid IN
  3  (SELECT pid FROM purchases WHERE cid = 'c005') AND NOT EXISTS
  4  (SELECT * FROM purchases WHERE cid = c.cid AND pid = p.pid))
  5  /

CID  NAME                                                                                                                                                                                               
---- ---------------                                                                                                                                                                                    
c003 Chris                                                                                                                                                                                              
c005 Mike                                                                                                                                                                                               

SQL> start query11
SQL> SELECT pu.cid FROM purchases pu, products pr
  2  WHERE pr.pid = pu.pid AND original_price > 200
  3  AND to_char(ptime, 'DD-MM-YYYY') LIKE '%10-2017'
  4  /

CID                                                                                                                                                                                                     
----                                                                                                                                                                                                    
c001                                                                                                                                                                                                    

SQL> start query12
SQL> SELECT e.eid, e.name FROM employees e WHERE e.eid IN
  2  (SELECT pu.eid FROM purchases pu, customers c
  3  WHERE pu.cid = c.cid AND c.cid IN
  4  (SELECT DISTINCT c.cid FROM customers c, products pr, purchases pu
  5  WHERE pu.cid = c.cid AND pu.pid = pr.pid AND pr.name IN ('camera', 'chair')))
  6  /

EID NAME                                                                                                                                                                                                
--- ---------------                                                                                                                                                                                     
e01 David                                                                                                                                                                                               
e02 Peter                                                                                                                                                                                               
e03 Susan                                                                                                                                                                                               

SQL> start query13
SQL> SELECT c.name FROM customers c WHERE c.cid IN
  2  (SELECT pu.cid FROM purchases pu WHERE total_price =
  3  (SELECT MAX(total_price) FROM purchases))
  4  /

NAME                                                                                                                                                                                                    
---------------                                                                                                                                                                                         
Chris                                                                                                                                                                                                   

SQL> start query14
SQL> COLUMN c2 HEADING 'discount amount'
SQL> 
SQL> SELECT * FROM (SELECT pid, name, original_price * discnt_rate AS c2
  2  FROM products ORDER BY c2 DESC) WHERE rownum <=1
  3  /

PID  NAME            discount amount                                                                                                                                                                    
---- --------------- ---------------                                                                                                                                                                    
p008 computer                  149.7                                                                                                                                                                    

SQL> start query15
SQL> COLUMN c3 HEADING 'Total Sale'
SQL> 
SQL> SELECT to_char(ptime, 'YYYY/MM') AS Month, SUM(total_price) AS c3
  2  FROM purchases
  3  GROUP BY to_char(ptime, 'YYYY/MM') ORDER BY Month
  4  /

MONTH   Total Sale                                                                                                                                                                                      
------- ----------                                                                                                                                                                                      
2017/08     283.69                                                                                                                                                                                      
2017/09    1064.56                                                                                                                                                                                      
2017/10     627.18                                                                                                                                                                                      

SQL> start query16
SQL> COLUMN c4 HEADING 'total quantity sold'
SQL> 
SQL> SELECT pr.pid, pr.name, SUM(pu.qty) AS c4 FROM products pr, purchases pu
  2  WHERE pr.pid = pu.pid AND pr.pid IN
  3  (SELECT pid FROM purchases WHERE qty =
  4  (SELECT MAX(qty) FROM purchases)) GROUP BY pr.pid, pr.name;

PID  NAME            total quantity sold                                                                                                                                                                
---- --------------- -------------------                                                                                                                                                                
p004 pencil                           15                                                                                                                                                                

SQL> start query17
SQL> SELECT pur#, original_price * qty - total_price AS saving
  2  FROM purchases pu, products pr WHERE pr.pid = pu.pid AND pur# IN
  3  (SELECT pur# FROM purchases WHERE original_price * qty - total_price =
  4  (SELECT MAX(original_price * qty - total_price) FROM purchases pu,
  5  products pr WHERE pu.pid = pr.pid)) ORDER BY saving DESC
  6  /

      PUR#     SAVING                                                                                                                                                                                   
---------- ----------                                                                                                                                                                                   
    100012      299.4                                                                                                                                                                                   

SQL> start query19
SQL> COLUMN c5 HEADING 'total amount spent'
SQL> 
SQL> SELECT name, c5 FROM (SELECT c.name, SUM(total_price) AS c5
  2  FROM customers c, purchases p WHERE c.cid = p.cid
  3  GROUP BY c.name ORDER BY SUM(total_price) DESC) WHERE rownum < 4
  4  /

NAME            total amount spent                                                                                                                                                                      
--------------- ------------------                                                                                                                                                                      
Chris                       752.68                                                                                                                                                                      
Kathy                       679.35                                                                                                                                                                      
Connie                      221.55                                                                                                                                                                      

SQL> start query20
SQL> (SELECT pr.pid, pr.name, count(*) AS c6 FROM products pr, purchases pu, customers c
  2  WHERE pr.pid = pu.pid AND c.cid = pu.cid
  3  AND to_char(ptime, 'DD-MM-YYYY') LIKE '%10-2017'
  4  GROUP BY pr.pid, pr.name)
  5  UNION
  6  (SELECT pr.pid, pr.name, 0 AS c6
  7  FROM products pr, purchases pu, customers c
  8  WHERE pr.pid = pu.pid AND c.cid = pu.cid
  9  AND to_char(ptime, 'MM-YYYY')  != '10-2017'
 10  GROUP BY pr.pid, pr.name )
 11  /

PID  NAME                    C6                                                                                                                                                                         
---- --------------- ----------                                                                                                                                                                         
p001 stapler                  1                                                                                                                                                                         
p002 TV                       0                                                                                                                                                                         
p003 camera                   0                                                                                                                                                                         
p004 pencil                   2                                                                                                                                                                         
p005 chair                    0                                                                                                                                                                         
p006 lamp                     0                                                                                                                                                                         
p007 tablet                   1                                                                                                                                                                         
p008 computer                 0                                                                                                                                                                         
p008 computer                 1                                                                                                                                                                         
p009 powerbank                1                                                                                                                                                                         

10 rows selected.

SQL> spool off
