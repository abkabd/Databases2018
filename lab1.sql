CREATE DATABASE lab1;

CREATE TABLE users (
  id SERIAL,
  firstname   VARCHAR(50),
  lastname VARCHAR(50)
);

ALTER TABLE users
    ADD COLUMN isadmin INT;

ALTER TABLE users
    ALTER isadmin TYPE bool USING CASE WHEN isadmin=0 THEN FALSE ELSE TRUE END;

ALTER TABLE users
    ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users
    ADD CONSTRAINT prim_constr PRIMARY KEY (id);


CREATE TABLE tasks (
  id SERIAL,
  name   VARCHAR(50),
  user_id INT
);


DROP TABLE tasks;

DROP DATABASE lab1;

/* ////////////////////////////////////////////  */


INSERT into users(firstname, lastname) VALUES('Abc', 'Cdf');
INSERT into users(firstname, lastname) VALUES('Hello', 'Man');
SELECT * FROM users;
DELETE FROM users;
DROP TABLE users;

