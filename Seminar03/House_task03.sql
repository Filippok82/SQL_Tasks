CREATE DATABASE house_task03;
USE house_task03;
CREATE TABLE staff
(
	id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
     surname VARCHAR(45),
     speciality VARCHAR(45),
     seniority INT, 
	 salary INT,
     age INT
);

INSERT INTO staff (name,surname,speciality,seniority,salary,age)
VALUES
	("Вася", "Васькин", "начальник", 40, 100000, 60), 	
    ("Петя", "Петькин", "начальник", 8, 70000, 30), 	
	("Катя", "Катькина", "инженер", 2, 70000, 25), 		
    ("Саша", "Сашкин", "инженер", 12, 50000, 35), 		
	("Иван", "Иванов", "рабочий", 40, 30000, 59),		
    ("Петр", "Петров", "рабочий", 20, 25000, 40),
	("Сидор", "Сидоров", "рабочий", 10, 20000, 35),
    ("Антон", "Антонов", "рабочий", 8, 19000, 28),
    ("Юра", "Юркин", "рабочий", 5, 15000, 25),
    ("Максим", "Воронин", "рабочий", 2, 11000, 22),
    ("Юра", "Галкин", "рабочий", 3, 12000, 24),
    ("Люся", "Люськина", "уборщик", 10, 10000, 49);
	

SELECT * FROM staff;

-- 1. Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
 # ПО УБЫВАНИЮ 
SELECT *
FROM staff
ORDER BY  salary DESC;
 
 # ПО ВОЗРАСТАНИЮ 
SELECT *
FROM staff
ORDER BY  salary;

-- 2. Выведите 5 максимальных зарплат (salary)

SELECT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Подсчитать суммарную зарплату(salary) по каждой специальности (speciality)

SELECT  speciality, SUM(salary) AS sum_salary
FROM staff 
GROUP BY speciality;

-- 4. Найти количество сотрудников по специальности “Рабочий” (speciality) в возрасте от 24 до 42 лет.
SELECT speciality, COUNT(*) AS Count_speciality
FROM staff
WHERE speciality = "Рабочий" AND age >= 24 AND age <= 42;

-- 5. Найти количество специальностей
# количество специальностей
SELECT COUNT(DISTINCT speciality) AS count_speciality
FROM staff;

# количество человек по специальности
SELECT speciality, COUNT(*) AS Count_man
FROM staff
GROUP BY speciality;

-- 6. Вывести специальности, у которых средний возраст сотрудника меньше 44 лет
SELECT speciality, AVG(age) AS middle_age
FROM staff
GROUP BY speciality
HAVING AVG(age)<44;
