USE lesson_1; # "use lesson_1" - работа происходит в БД по имени lesson_1
-- 1.	Получить список с информацией обо всех студентах
SELECT *
FROM Student; # БД.Таблица

# 2. 	Получить список всех студентов с именем “Антон”(или любого существующего студента)
SELECT name,email
FROM Student
WHERE name = "ВИКТОР";
/* Это многострочный комментарий
*/
# 3.	Вывести имя и почту студента из таблички "Студент"
SELECT name,email
FROM Student;

# 4. 	Выбрать студентов, имена которых начинаются с буквы «В».
SELECT name, phone
FROM Student
WHERE name LIKE "в%";
# _
SELECT name, phone
FROM Student
WHERE name LIKE "%р%"; 

-- 5.	Выбрать всех студентов,у которых СТИПЕНДИЯ больше 6000
SELECT *
FROM Student
WHERE scholarship >= 6000;

-- 6.	Покажите всех студентов, которые принадлежат к курсу IT.
SELECT name, course_name
FROM Student
WHERE course_name = "IT";

-- 7.	Покажите всех студентов, которые НЕ принадлежат к курсу IT.
SELECT name, course_name
FROM Student
WHERE course_name <> "IT"; # != - неравенство
