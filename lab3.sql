CREATE DATABASE lab3;
------------------1)

--(copied content from lab3.sql and run)
------------------2)

SELECT lastname FROM employees;
------------------3)

SELECT DISTINCT lastname FROM employees;
------------------4)

SELECT * FROM employees
    WHERE lastname = 'Smith';
------------------5)

SELECT * FROM employees
    WHERE lastname = 'Smith' OR lastname = 'Doe';
------------------6)

SELECT * FROM employees
    WHERE department = 14;
------------------7)

SELECT * FROM employees
    WHERE department = 37 OR department = 77;
------------------8)

SELECT sum(budget) FROM departments;
------------------9)

SELECT department, count(*)
    FROM employees
    GROUP BY department;
-----------------10)

SELECT department, count(*)
    FROM employees
    GROUP BY department
    HAVING count(*) > 2;
-----------------11)

SELECT name FROM departments
    ORDER BY budget DESC
    LIMIT 1 OFFSET 1;
-----------------12)

SELECT employees.name, employees.lastname FROM employees,departments
    WHERE employees.department = departments.code
    ORDER BY departments.budget ASC
    LIMIT 1;
-----------------13)

SELECT employees.name FROM employees
    WHERE employees.city = 'Almaty'
      UNION ALL
SELECT customers.name FROM customers
    WHERE customers.city = 'Almaty';
-----------------14)

SELECT * FROM departments
    WHERE budget > 60000
    ORDER BY budget ASC, code DESC;
-----------------15)

UPDATE departments SET budget = budget*0.9
    WHERE budget =
          (SELECT budget FROM departments
              ORDER BY budget ASC
              LIMIT 1)
    RETURNING *;
-----------------16)

UPDATE employees SET department =
                       (SELECT code FROM departments
                              WHERE name = 'IT')
    WHERE department = (SELECT code FROM departments
                              WHERE name = 'Research')
    RETURNING *;
-----------------17)

DELETE FROM employees
    WHERE department = (SELECT code FROM departments
                              WHERE name = 'IT')
    RETURNING *;
-----------------18)

DELETE FROM employees
    RETURNING *;
-----------------19)
