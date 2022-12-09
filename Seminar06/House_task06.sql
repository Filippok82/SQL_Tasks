-- 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE FUNCTION formatting(num INT)
RETURNS CHAR(40)
DETERMINISTIC
BEGIN
DECLARE DD CHAR(10);
DECLARE HH, MM, SS CHAR(10);
DECLARE result CHAR(40);
SET DD = CAST(floor(num/60/60/24) AS CHAR(10));
SET HH = CAST(floor(mod(num/60/60/24,1)*24) AS CHAR(10));
SET MM = CAST(floor(mod(mod(num/60/60/24,1)*24,1)*60) AS CHAR(10));
SET SS = CAST(round(mod(mod(mod(num/60/60/24,1)*24,1)*60,1)*60) AS CHAR(10));
SET result = CONCAT(DD,' days ',HH,' hours ',MM,' minutes ',SS, ' seconds ');
RETURN result;
END $$
DELIMITER ;

SELECT formatting(123456) AS RESULT;



-- 2.	Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
DELIMITER $$
CREATE PROCEDURE even_numbers()
BEGIN
 DECLARE num INT default 0; 
 DECLARE result VARCHAR(20) default " " ;
 SET num = 2;
 WHILE num <= 10 DO
   SET result = CONCAT(result, num ,"," );
   SET num = num + 2;
 END WHILE;
 SELECT result;
END $$
DELIMITER ;

CALL even_numbers();