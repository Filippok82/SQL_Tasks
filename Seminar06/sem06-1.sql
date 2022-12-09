DELIMITER //
CREATE PROCEDURE hello()
BEGIN
	CASE
		WHEN CURTIME() BETWEEN '06:00:00' AND '11:59:00' THEN
			SELECT 'Доброе утро';
		WHEN CURTIME() BETWEEN '12:00:00' AND '17:59:00' THEN
			SELECT 'Добрый день';
		WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:00' THEN
			SELECT 'Добрый вечер';
		ELSE -- "00-06"
			SELECT "Доброй ночи";
	END CASE;
END //
DELIMITER ;

CALL hello();

DELIMITER $$
CREATE FUNCTION fibonacci(num INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE fib1 INT DEFAULT 0;
    DECLARE fib2 INT DEFAULT 1;
    DECLARE fib3 INT DEFAULT 0;
    DECLARE result VARCHAR(30) DEFAULT '0 1';
    
    IF num = 1 THEN
        RETURN fib1;
    ELSEIF num = 2 THEN
        RETURN CONCAT(fib1, fib2);
    ELSE
        WHILE num > 2 DO
            SET fib3 = fib1 + fib2;
            SET fib1 = fib2;
            SET fib2 = fib3;
            SET num = num - 1;
            SET result = CONCAT(result, " ", fib3);
        END WHILE;
        RETURN result;
    END IF;
END $$
DELIMITER ;

SELECT fibonacci(8);

