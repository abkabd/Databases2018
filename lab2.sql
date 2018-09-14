CREATE DATABASE lab2; -- 1)

CREATE TABLE countries(
    country_id SERIAL CONSTRAINT country_id_constr PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INTEGER,
    population INTEGER
); -- 2)

INSERT INTO countries
    VALUES(DEFAULT, 'Kazakhstan', 17, 18000000); -- 3)

INSERT INTO countries(country_id, country_name)
    VALUES (DEFAULT, 'Russia'); -- 4)

INSERT INTO countries(region_id)
    VALUES (NULL); -- 5)

INSERT INTO countries
    VALUES (DEFAULT, 'USA', 19, 350000000),
           (DEFAULT, 'France', 15, 66000000),
           (DEFAULT, 'Germany', 15, 82000000); -- 6)

ALTER TABLE countries
    ALTER COLUMN country_name
        SET DEFAULT 'Kazakhstan'; -- 7)

INSERT INTO countries (country_name)
    VALUES (DEFAULT); -- 8)

INSERT INTO countries
    DEFAULT VALUES; -- 9)

CREATE TABLE countries_new(
    LIKE countries INCLUDING CONSTRAINTS
); -- 10)

INSERT INTO countries_new
    SELECT * FROM countries; -- 11)

UPDATE countries
    SET region_id = 1
        WHERE region_id IS NULL; -- 12)

UPDATE countries
    SET population = population*1.1
        RETURNING country_name, population AS "New Population"; -- 13)

DELETE FROM countries
    WHERE population < 100000; -- 14)

DELETE FROM countries_new AS cn USING countries AS c
    WHERE c.country_id = cn.country_id
        RETURNING *; -- 15)

DELETE FROM countries
        RETURNING *; -- 16)


