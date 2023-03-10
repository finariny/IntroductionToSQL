/*
Домашнее задание по уроку "Введение в SQL"

Задание 1
 */

CREATE DATABASE skypro;

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
VALUES
    ('Ivan', 'Popov', 'male', 24),
    ('Maksim', 'Osipov', 'male', 43),
    ('Alina', 'Romanova', 'female', 21);

SELECT * FROM employee;

UPDATE employee SET first_name = 'Ksenia', last_name = 'Tronina', gender = 'female', age = 57
                WHERE id = 2;

SELECT * FROM employee;

DELETE FROM employee
       WHERE id = 3;

SELECT * FROM employee;

/*
Домашнее задание по уроку "Выборка данных и вложенные запросы"

Задание 1
*/

INSERT INTO employee (first_name, last_name, gender, age)
VALUES
    ('Nikolai', 'Fedotov', 'male', 32),
    ('Ekaterina', 'Matveeva', 'female', 22),
    ('Oleg', 'Makarov', 'male', 27);

SELECT first_name AS Имя,
       last_name AS Фамилия
FROM employee;

SELECT * FROM employee
WHERE age < 30 OR age > 50;

SELECT * FROM employee
WHERE age BETWEEN 30 AND 50;

SELECT * FROM employee
ORDER BY last_name DESC;

SELECT * FROM employee
WHERE LENGTH(first_name) > 4;

/*
Задание 2
*/

UPDATE employee SET first_name = 'Nikolai'
WHERE last_name = 'Popov';

UPDATE employee SET first_name = 'Ksenia'
WHERE last_name = 'Matveeva';

SELECT first_name AS Имя,
       SUM(age) AS Суммарный_возраст
FROM employee
GROUP BY Имя;

SELECT first_name AS Имя,
       MIN(age) AS Минимальный_возраст
FROM employee
GROUP BY Имя;

SELECT first_name AS Имя,
       MAX(age) AS Максимальный_возраст
FROM employee
GROUP BY Имя
HAVING COUNT(first_name) > 1
ORDER BY Максимальный_возраст;

/*
Домашнее задание по уроку "Работа с несколькими таблицами"

Задание 1
*/

CREATE TABLE city
(
    city_id BIGSERIAL NOT NULL PRIMARY KEY,
    city_name VARCHAR(200) NOT NULL
);

ALTER TABLE employee
    ADD city_id INT;

ALTER TABLE employee
    ADD FOREIGN KEY (city_id)
        REFERENCES city(city_id);

INSERT INTO city (city_name)
VALUES
    ('Moscow'),
    ('Saint Petersburg'),
    ('Kazan'),
    ('Dzerzhinsk'),
    ('Veliky Novgorod'),
    ('Barnaul');

UPDATE employee SET city_id = 1
WHERE last_name = 'Tronina';

UPDATE employee SET city_id = 1
WHERE last_name = 'Popov';

UPDATE employee SET city_id = 2
WHERE last_name = 'Matveeva';

UPDATE employee SET city_id = 3
WHERE last_name = 'Fedotov';

UPDATE employee SET city_id = 4
WHERE last_name = 'Makarov';

/*
Задание 2
*/

SELECT first_name, last_name, city_name
FROM employee
         INNER JOIN city
                    ON employee.city_id = city.city_id;

SELECT city_name, first_name, last_name
FROM city
         LEFT JOIN employee
                   ON city.city_id = employee.city_id;

SELECT first_name, city_name
FROM employee
         FULL JOIN city
                   ON employee.city_id = city.city_id;

SELECT first_name, city_name
FROM employee
         CROSS JOIN city;