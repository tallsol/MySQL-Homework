/*
	Основное ДЗ:
		1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
		Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
		2. Выведите только четные числа от 1 до 10 (Через цикл).
		Пример: 2,4,6,8,10
*/

CREATE DATABASE IF NOT EXISTS hw_6;
USE hw_6;


--  1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.

DROP PROCEDURE IF EXISTS times_format;

DELIMITER //
CREATE PROCEDURE times_format(seconds INT)
BEGIN
    DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;

    WHILE seconds >= 86400 DO
    SET days = seconds / 86400;
    SET seconds = seconds % 86400;
    END WHILE;

    WHILE seconds >= 3600 DO
    SET hours = seconds / 3600;
    SET seconds = seconds % 3600;
    END WHILE;

    WHILE seconds >= 60 DO
    SET minutes = seconds / 60;
    SET seconds = seconds % 60;
    END WHILE;
    
	SELECT days, hours, minutes, seconds;
END //
DELIMITER ;

CALL times_format(123456);


--  2. Выведите только четные числа от 1 до 10 (Через цикл).

DROP PROCEDURE IF EXISTS times_format;

DELIMITER //
CREATE PROCEDURE even_number()
BEGIN
    DECLARE num INT default 0;
    
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (num INT);

	WHILE num < 10 DO
    SET num = num + 2;
    INSERT INTO nums VALUES(num);
    END WHILE;

    SELECT * FROM nums;
END //
DELIMITER ;

CALL even_number();
