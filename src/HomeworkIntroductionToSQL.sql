/*
Задание 1
 */

CREATE DATABASE skypro;
\c skypro

/*
Задание 2
 */

CREATE TABLE employee (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    age INT NOT NULL
                      );

/*
Задание 3
 */

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Ivan', 'Popov', 'male', 24);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Maksim', 'Osipov', 'male', 43);

INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Alina', 'Romanova', 'female', 21);

SELECT * FROM employee;

UPDATE employee SET first_name = 'Ksenia', last_name = 'Tronina', gender = 'female', age = 57
                WHERE id = 2;

SELECT * FROM employee;

DELETE FROM employee
       WHERE id = 3;

SELECT * FROM employee;