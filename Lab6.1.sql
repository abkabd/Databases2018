CREATE DATABASE lab6_2;
------------------1)

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    manager_id INTEGER REFERENCES employees,
    department_id INTEGER REFERENCES departments
);

CREATE TABLE job_grades (
    grade CHAR(1),
    lowest_salary INTEGER,
    highest_salary INTEGER
);
------------------2)

SELECT first_name, e.department_id, city, state_province
    FROM employees e INNER JOIN departments d ON (e.department_id = d.department_id)
        JOIN locations l ON d.location_id = l.location_id
WHERE last_name LIKE '%b%';
------------------3)

SELECT department_name, city, state_province
    FROM departments d LEFT JOIN locations l ON d.location_id = l.location_id;
------------------4)

SELECT e1.first_name, e2.first_name
    FROM employees e1 LEFT JOIN employees e2 ON e1.employee_id = e2.manager_id;
------------------5)

SELECT grade, avg(salary)
    FROM employees INNER JOIN job_grades ON (salary BETWEEN lowest_salary AND highest_salary)
        GROUP BY grade;
------------------6)

SELECT first_name, last_name
    FROM employees e JOIN departments d ON (e.department_id = d.department_id)
        JOIN locations l ON (d.location_id = l.location_id AND l.city = 'London');
------------------7)
