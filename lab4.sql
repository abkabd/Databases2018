CREATE DATABASE lab4;
------------------1)

CREATE TABLE warehouses(
    code INTEGER PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);


CREATE TABLE boxes(
    code CHAR(4),
    contents VARCHAR(255),
    value REAL,
    warehouse INTEGER REFERENCES warehouses(code)
);
------------------2)

INSERT INTO Warehouses(Code,Location,Capacity)
    VALUES (1,'Chicago',3),
           (2,'Chicago',4),
           (3,'New York',7),
           (4,'Los Angeles',2),
           (5,'San Francisco',8);

INSERT INTO boxes(Code,Contents,Value,Warehouse)
   VALUES ('0MN7','Rocks',180,3),
          ('4H8P','Rocks',250,1),
          ('4RT3','Scissors',190,4),
          ('7G3H','Rocks',200,1),
          ('8JN6','Papers',75,1),
          ('8Y6U','Papers',50,3),
          ('9J6F','Papers',175,2),
          ('LL08','Rocks',140,4),
          ('P0H6','Scissors',125,1),
          ('P2T6','Scissors',150,2),
          ('TU55','Papers',90,5);
------------------3)

SELECT * FROM warehouses;
------------------4)

SELECT * FROM boxes
    WHERE value > 150;
------------------5)

SELECT DISTINCT ON(contents) * FROM boxes;
------------------6)

SELECT warehouse, count(*) FROM boxes
    GROUP BY warehouse;
------------------7)

SELECT warehouse, count(*) FROM boxes
    GROUP BY warehouse
    HAVING count(*) > 2;
------------------8)

INSERT INTO warehouses
    VALUES (6, 'New York', 3);
------------------9)

INSERT INTO boxes
    VALUES ('H5RT', 'Paper', 200, 6);
------------------10)

SELECT * FROM boxes;

UPDATE boxes SET value = value*1.15
    WHERE code IN (SELECT code FROM boxes
                    ORDER BY value DESC LIMIT 1 OFFSET 2);
------------------11)

DELETE FROM boxes
    WHERE value < 150;
------------------12)

DELETE FROM boxes
    WHERE warehouse IN (SELECT code FROM warehouses
                            WHERE location = 'New York')
    RETURNING *;
------------------13)
