CREATE DATABASE lab5;
------------------1)

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INTEGER,
    salesman_id INTEGER
);
------------------2)

SELECT * FROM customers
    WHERE grade > 100;
------------------3)

SELECT * FROM customers
    WHERE grade > 100 AND city = 'New York';
------------------4)

SELECT * FROM customers
    WHERE grade > 100 OR city = 'New York';
------------------5)

SELECT * FROM customers
    WHERE city = 'Paris' OR city = 'Rome';
------------------6)

SELECT * FROM customers
    WHERE cust_name LIKE 'B%';
------------------7)

CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    description TEXT,
    purch_amt INTEGER
);
------------------8)

SELECT * FROM orders
    WHERE customer_id IN
          (SELECT customer_id FROM customers
                WHERE city = 'New York');
------------------9)

SELECT * FROM customers
    WHERE customer_id IN
          (SELECT customer_id FROM orders
                GROUP BY customer_id
                HAVING count(*) > 10);
------------------10)

SELECT sum(purch_amt) AS "Total purchase amount" FROM orders;
------------------11)

SELECT avg(purch_amt) AS "Average purchase amount" FROM orders;
------------------12)

SELECT * FROM customers
    WHERE cust_name IS NOT NULL;
------------------13)

SELECT max(purch_amt) AS "Maximum purchase amount" FROM orders;
------------------14)
