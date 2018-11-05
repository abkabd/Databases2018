CREATE DATABASE lab8;
------------------1)

CREATE TABLE salesman(
   salesman_id INTEGER PRIMARY KEY,
   name VARCHAR(255),
   city VARCHAR(255),
   commission NUMERIC
);

CREATE TABLE customers(
   customer_id INTEGER PRIMARY KEY,
   cust_name VARCHAR(255),
   city VARCHAR(255),
   grade INTEGER,
   salesman_id INTEGER REFERENCES salesman(salesman_id)
);

CREATE TABLE orders(
   ord_no INTEGER PRIMARY KEY,
   purch_amt NUMERIC,
   ord_date DATE,
   customer_id INTEGER REFERENCES customers(customer_id),
   salesman_id INTEGER REFERENCES salesman(salesman_id)
);
------------------2)

CREATE ROLE junior_dev LOGIN PASSWORD '123';
------------------3)

CREATE VIEW v1 AS
   SELECT c.cust_name, avg(o.purch_amt), sum(o.purch_amt) FROM customers c JOIN orders o ON (c.customer_id = o.customer_id)
   GROUP BY c.cust_name;
------------------4)

CREATE VIEW v2 AS
   SELECT c.city, count(*) FROM customers c JOIN orders o ON (c.customer_id = o.customer_id)
   GROUP BY c.city;

GRANT ALL PRIVILEGES ON v2 TO junior_dev;
------------------5)

CREATE VIEW v3 AS
   SELECT cust_name, grade FROM customers
   WHERE grade IN (SELECT min(grade) FROM customers);

GRANT SELECT ON v3 TO junior_dev;
------------------6)

CREATE VIEW v4 AS
   SELECT grade, count(*) FROM customers c JOIN salesman s ON c.salesman_id = s.salesman_id
   GROUP BY grade;
------------------7)

CREATE VIEW v5 AS
   SELECT name FROM salesman
   WHERE salesman_id IN
        (SELECT salesman_id FROM orders
         GROUP BY salesman_id
         HAVING count(ord_no) > 1);
------------------8)

CREATE ROLE intern;
REASSIGN OWNED BY junior_dev TO intern;
------------------9)

