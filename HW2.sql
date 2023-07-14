/*
	Основное:
		1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
		2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
		3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
*/

CREATE DATABASE IF NOT EXISTS hw_2; -- создание БД для второго дз 
USE hw_2; -- подключение к БД


-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

DROP TABLE IF EXISTS sales; -- создание таблицы
CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT, -- создание первичного ключа
    order_date DATE NOT NULL, -- строчка с указанием даты заказа
    count_product VARCHAR(45) NOT NULL -- строчка с указанием количества товаров
);

INSERT sales (order_date, count_product) -- заполнение таблицы
VALUES
	("2022-01-01", "156"), -- id = 1
    ("2022-01-02", "180"), -- id = 2
    ("2022-01-03", "21"), -- id = 3
    ("2022-01-04", "124"), -- id = 4
    ("2022-01-05", "341"); -- id = 5
SELECT * FROM sales;


-- 	2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT * FROM sales;
SELECT
id,
count_product,
CASE
	WHEN count_product < 100
		THEN "Маленький заказ"
	WHEN count_product > 100 && count_product < 300
		THEN "Средний заказ"
	ELSE "Большой заказ"
	END AS sales_type
FROM sales;


-- 	3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
DROP TABLE IF EXISTS orders; -- создание таблицы
CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    employee_id VARCHAR(45) NOT NULL, 
    amount FLOAT(45), 
    order_status VARCHAR(45)
);

INSERT orders (employee_id, amount, order_status) -- заполнение таблицы
VALUES
	("e03", "15", "OPEN"), -- id = 1
    ("e01", "25.5", "OPEN"), -- id = 2
    ("e05", "100.7", "CLOSED"), -- id = 3
    ("e02", "22.18", "OPEN"), -- id = 4
    ("e04", "9.5", "CANCELLED"); -- id = 5
SELECT * FROM orders;


-- Покажите “полный” статус заказа, используя оператор CASE
SELECT * FROM orders;
SELECT
	id AS "Номер заказа",
    employee_id AS "Номер работника",
    amount AS "Количество",
    order_status AS "Статус заказа",
    CASE
		WHEN order_status = "OPEN" THEN "Order is in open state"
        WHEN order_status = "CLOSED" THEN "Order is closed"
		WHEN order_status = "CANCELLED" THEN "Order is cancelled"
        ELSE "Не определено"
	END AS "Полное описание"
FROM orders;