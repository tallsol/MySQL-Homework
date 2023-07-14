/* 
	1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
	2. Выведите название, производителя и цену для товаров, количество которых превышает 2
	3. Выведите весь ассортимент товаров марки “Samsung”
	4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
		4.1. Товары, в которых есть упоминание "Iphone"
		4.2. "Galaxy"
		4.3. Товары, в которых есть ЦИФРЫ(REGEXP - регулярки, либо RLIKE)
		4.4. Товары, в которых есть ЦИФРА "8"
*/

-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
CREATE DATABASE IF NOT EXISTS HW_1; -- создание БД для первого дз 
USE HW_1; -- подключение к БД

DROP TABLE IF EXISTS phone; -- создание таблицы
CREATE TABLE phone
(
	id INT PRIMARY KEY AUTO_INCREMENT, -- создание первичного ключа
    ProductName VARCHAR(45) NOT NULL, -- строчка с указанием модели
    Manufacturer VARCHAR(45), -- строчка с указанием производителя
    ProductCount VARCHAR(45), -- строчка с количеством моделей
    Price VARCHAR(45) NOT NULL -- строчка с ценой
);

INSERT phone (ProductName,Manufacturer,ProductCount,Price) -- заполнение таблицы
VALUES
	("IPhone X", "Apple", "3", "76000"), -- id = 1
    ("IPhone 8", "Apple", "2", "51000"), -- id = 2
    ("Galaxy S9", "Samsung", "2", "56000"), -- id = 3
    ("Galaxy S8", "Samsung", "1", "41000"), -- id = 4
    ("P20 Pro", "Huawei", "5", "36000"); -- id = 5
SELECT * FROM phone;


-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturer, ProductCount -- выбираем выводимые параметры
FROM phone -- выбираем откуда их выводить
WHERE ProductCount > 2; -- выбираем условие


-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT ProductName,Manufacturer,ProductCount,Price -- выбираем выводимые параметры
FROM phone -- выбираем откуда их выводить
WHERE Manufacturer = "Samsung"; -- выбираем условие


-- 	4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT ProductName,Manufacturer,ProductCount,Price -- выбираем выводимые параметры
FROM phone -- выбираем откуда их выводить
WHERE Price * ProductCount > 100000 && Price * ProductCount < 145000; -- выбираем условие 


--  4.1. Товары, в которых есть упоминание "Iphone"
SELECT ProductName,Manufacturer,ProductCount,Price -- выбираем выводимые параметры
FROM phone -- выбираем откуда их выводить
WHERE ProductName LIKE "IPhone%"; -- выбираем условие


--  4.2. "Galaxy"
SELECT ProductName,Manufacturer,ProductCount,Price -- выбираем выводимые параметры
FROM phone -- выбираем откуда их выводить
WHERE ProductName LIKE "Galaxy%"; -- выбираем условие


--  4.3. Товары, в которых есть ЦИФРЫ(REGEXP - регулярки, либо RLIKE)
SELECT ProductName,Manufacturer,ProductCount,Price -- выбираем выводимые параметры
FROM phone -- выбираем откуда их выводить
WHERE ProductName REGEXP "[1-9][0-9]*"; -- выбираем условие


--  4.4. Товары, в которых есть ЦИФРА "8"
SELECT ProductName,Manufacturer,ProductCount,Price -- выбираем выводимые параметры
FROM phone -- выбираем откуда их выводить
WHERE ProductName LIKE "%8"; -- выбираем условие