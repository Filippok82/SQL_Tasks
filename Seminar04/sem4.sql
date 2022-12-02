CREATE DATABASE lesson_4;
USE lesson_4;

CREATE TABLE teachers
(	
	id INT NOT NULL PRIMARY KEY,
    surname VARCHAR(45),
    salary INT
);

INSERT teachers
VALUES
	(1,"Авдеев", 17000),
    (2,"Гущенко",27000),
    (3,"Пчелкин",32000),
    (4,"Питошин",15000),
    (5,"Вебов",45000),
    (6,"Шарпов",30000);
    
SELECT * from teachers; 

CREATE TABLE lessons
(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(45),
    teacher_id INT,
    FOREIGN KEY (teacher_id)  REFERENCES teachers(id) # teachers(id) => таблица(поле)
);
INSERT INTO lessons(course,teacher_id)
VALUES
	("Знакомство с веб-технологиями",1),
    ("Знакомство с веб-технологиями",2),
    ("Знакомство с языками программирования",3),
    ("Базы данных и SQL",4);
    
# SELECT column
# FROM Table t1
# ...JOIN Table2 t2 on t1.id = t2.id

-- Получить фамилию учителей и курсы, которые они ведут
SELECT t.surname, l.course # l - lesson, t - teachers
FROM teachers t  # псевдоним для таблицы: название_таблицы псевдоним
INNER JOIN lessons l ON t.id = l.teacher_id;

-- Выбрать фамилию всех учителей и курсы, которые они ведут. Если учитель не ведет курс, его фамилию все равно необходимо вывести
SELECT t.surname, l.course # l - lesson, t - teachers
FROM teachers t  # псевдоним для таблицы: название_таблицы псевдоним
LEFT JOIN lessons l ON t.id = l.teacher_id;

-- Вывести учителей, которые не ведут никакие курсы
SELECT t.surname, l.course # l - lesson, t - teachers
FROM teachers t  # псевдоним для таблицы: название_таблицы псевдоним
LEFT JOIN lessons l ON t.id = l.teacher_id
WHERE l.teacher_id IS NULL;

-- Получите список курсов и учителей , которые их ведут (RIGHT JOIN) 
SELECT t.surname, l.course # l - lesson, t - teachers
FROM teachers t  # псевдоним для таблицы: название_таблицы псевдоним
RIGHT JOIN lessons l ON t.id = l.teacher_id;

-- Получить информацию по учителям , которые ведут курс "Знакомство с веб-технологиями"
SELECT t1.*, t2.* FROM teachers t1 # t1 = teachers
INNER JOIN (
			SELECT course, teacher_id
            FROM lessons
            WHERE course = "Знакомство с веб-технологиями"
) t2
ON t1.id = t2.teacher_id;

SELECT 'Z' IN('A', 'B', 'C', 'D') AS Res; # True(1) , False(0)
SELECT 'Z' NOT IN('A', 'B', 'C', 'D') AS Res;
-- Получить столбцы из таблицы “clients” , в которых первое имя является набором значений (Mikle, Tom)
SELECT *
FROM clients 
WHERE login IN ("Mikle", "Tom"); #  IN ("Mikle", "Tom") = login = "Mikle" OR login = "Tom" 

SELECT *
FROM clients 
WHERE "Mikle" NOT IN (login);

