CREATE DATABASE lab7;

CREATE TABLE countries(
   name VARCHAR(255)
);

CREATE TABLE departments(
   department_id INTEGER PRIMARY KEY,
   bugget INTEGER
);

CREATE TABLE employees(
   name VARCHAR(255),
   surname VARCHAR(255),
   salary INTEGER,
   department_id INTEGER references departments(department_id)
);
------------------0)

CREATE INDEX countries_index ON countries USING HASH (name);
------------------1)

CREATE INDEX employees_index1 ON employees (name, surname);
------------------2)

CREATE UNIQUE INDEX employees_unique_index2 ON employees (salary);
------------------3)

CREATE INDEX employees_substr_index ON employees (substring(name, 1, 4));
------------------4)

CREATE INDEX employees_index3 ON employees (department_id, salary);
CREATE INDEX departments_index ON departments (department_id, bugget);
------------------5)

