-- Создание БД
CREATE DATABASE lesson_3;

USE lesson_3; -- Работаем с конкретной БД - lesson_3
-- Создание таблицы
CREATE TABLE workers
(
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45), -- "ё" на англ. раскладке клавиатуры
    `surname` VARCHAR(45),
    `speciality` VARCHAR(45),
    `seniority` INT, 
    `salary` INT,
    `age` INT
);

# Заполнение таблички данными
INSERT INTO workers(name,surname,speciality,seniority,salary,age)
VALUES
	("Вася", "Васькин", "начальник", 40, 100000, 60), 	-- id = 1
    ("Петя", "Петькин", "начальник", 8, 70000, 30), 	-- id = 2
	("Катя", "Петькина", "инженер", 2, 70000, 25), 		-- id = 3
    ("Саша", "Сашкин", "инженер", 12, 50000, 35), 		-- id = 4
	("Иван", "Иванов", "рабочий", 20, 30000, 40),		-- id = 5
    ("Петр", "Петров", "рабочий", 40, 30000, 59); 		-- id = 6

SELECT * FROM workers;
# GROUP BY - группировка (g - группировка), order by - сортировка
# 1.	Выведите все записи, отсортированные по полю "age" по возрастанию
SELECT *
FROM workers
ORDER BY age; -- ASC - по возрастанию, дефолтный; DESC - по убыванию
# 2.	Выведите все записи, отсортированные по полю "name"
SELECT *
FROM workers
ORDER BY name DESC; 
# 3.	Выведите записи полей "name", "surname","age",
# отсортированные по полю "name" в алфавитном порядке по убыванию
SELECT name,surname,age
FROM workers
ORDER BY name DESC; 
# 4.	Выполните сортировку по полям "name" и "age" по убыванию
INSERT INTO workers(name,surname,speciality,seniority,salary,age)
VALUES
	("Петр", "Васькин", "начальник", 40, 100000, 60); 	
INSERT INTO workers(name,surname,speciality,seniority,salary,age)
VALUES
	("Мария", "Васькина", "начальник", 40, 100000, 60); 	
SELECT name,surname,age
FROM workers
ORDER BY age DESC, name DESC;

-- 1.	Выведите уникальные (неповторяющиеся) значения поля "name"
SELECT count(*)  -- Получение количестра строк из таблицы workers
FROM workers;
SELECT DISTINCT name
FROM workers; #  Из 8 строчек отнимаем 1 Петра = 7
-- 2.	Выведите первые две первые записи из таблицы
SELECT id, name
FROM workers
LIMIT 2;
-- 3.	Пропустите  первые 4 строки ("id" = 1, "id" = 2,"id" = 3,"id" = 4)
-- и извлеките следующие 3 строки ("id" = 5, "id" = 6, "id" = 7)
SELECT id, name
FROM workers
LIMIT 4,3; -- Пропускаем первые 4 строчки и выбираем следующие 3: 5,6,7

-- 4*. 	Пропустите две последнии строки (где id=8, id=7) 
-- и извлекаются следующие за ними 3 строки (где id=6, id=5, id=4) 
SELECT id, name
FROM workers
ORDER BY id DESC
LIMIT 2, 3;

-- Агрегатные функциии - ф-и, которые получают набор значений и выдают результат 1 цифрой
-- Сумма из значений 50,100,150,200 => 500 (AVG, SUM, MIN,MAX, COUNT())

-- Суммарную зарплату всех сотрудников нашего завода
SELECT SUM(salary) AS Result -- Псевдоним "Result" вместо столбца "SUM(salary)"
FROM workers;

-- Среднюю зарплату по специальности
SELECT AVG(salary) AS average , speciality, SUM(salary) AS sum,
COUNT(salary) AS count,  SUM(salary) / COUNT(salary) AS result_avg, 
MIN(salary), MAX(salary)
FROM workers 
GROUP BY speciality;

-- WHERE и HAVING
-- Не используется WHERE с HAVING

