SELECT custID, advance, sales FROM (
SELECT id AS custID FROM ac) c
JOIN (
SELECT SUM(advance) AS advance, cust_id FROM aa GROUP BY cust_id) a ON c.custID = a.cust_id 
JOIN (
SELECT SUM(qty) AS sales, cust_id FROM `as` GROUP BY cust_id) s ON c.custID = s.cust_id ;