/*
	Основное:
		1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
		2. Выведите 5 максимальных заработных плат (saraly)
		3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
		4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
		5. Найдите количество специальностей
		6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
*/

CREATE DATABASE IF NOT EXISTS hw_3; 
USE hw_3;


DROP TABLE IF EXISTS staff; 
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45) NOT NULL, 
    lastname VARCHAR(45) NOT NULL,
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2),
    age INT
);

TRUNCATE staff;
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
SELECT * FROM staff;


-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
SELECT 
    CONCAT(firstname, " ", lastname) AS fullname, 
    salary
FROM staff
ORDER BY salary;

SELECT 
    CONCAT(firstname, " ", lastname) AS fullname, 
    salary
FROM staff
ORDER BY salary DESC;


-- 2. Выведите 5 максимальных заработных плат (saraly)
SELECT 
    CONCAT(firstname, " ", lastname) AS fullname, 
    salary 
FROM staff
ORDER BY salary DESC
LIMIT 5;


-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT 
    post, 
    SUM(salary) 
FROM staff 
GROUP BY post;


-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT 
	CONCAT(firstname, " ", lastname) AS fullname,
    post,
    age
FROM staff
WHERE post = "Рабочий" AND age > 23 AND age < 50;

-- 5. Найдите количество специальностей
SELECT 
	COUNT(DISTINCT post) AS amount_of_posts
FROM staff;


-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT
    post
FROM staff
GROUP BY post
HAVING AVG(age) < 31;