# \! cls -  очистка консоли
SHOW databases;  -- Показ БД
CREATE database lesson_2; -- Создание БД
use lesson_2; -- использование БД с именем lesson_2
-- id -- уникальный идентификатор фильма,
-- title -- название фильма
-- title_eng -- название фильма на английском языке
-- year_movie  --  год выхода
-- count_min -- длительность фильма в минутах
-- storyline -- сюжетная линия, небольшое описание фильма
CREATE TABLE movies
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, -- название свойства(тип данных, ограничение)
    title VARCHAR(45) NOT NULL, -- строчка на 45 символов, varchar(45) - строчка на 45 символов
    title_eng VARCHAR(45) DEFAULT "-",
    year_movie INT,
    count_min INT, -- Целое число 
    storyline VARCHAR (100)
);
-- Вывести табличку movies 
SELECT * FROM movies;
-- Заполним табличку тестовыми значениями 
# INSERT табличка(столбе1,столбец2) 
# VALUES (значение1, значение2)
INSERT movies(title, title_eng, year_movie, count_min, storyline)
VALUES 
	("Игры разума", "A Beautiful Mind" , 2001, 135, "vkgfkkgfg"),
    ("Форрест Гамп", "Forrest Gump",1994,142,"ggdgsgsg"),
	(" Иван Васильевич меняет профессию","", 1998, 128,"vdgkjksgskgkskgkkg");
SELECT * FROM movies;
-- DROP TABLE name - удаляет табличку с именем name

RENAME TABLE movies TO cinema; -- movies => cinema

ALTER TABLE cinema
ADD Language VARCHAR(45) DEFAULT "hello"; 
SELECT * FROM cinema;
ALTER TABLE cinema
DROP Language;
SELECT * FROM test;

TRUNCATE TABLE test; -- Очистка всего содержимого таблицы "тест"
SELECT * FROM cinema;

ALTER TABLE cinema
ADD age_category VARCHAR(30);
INSERT cinema(title,title_eng, age_category)
VALUES ("П","П", "П"), ("П","П","Д"), ("П","П","В") ;

UPDATE cinema
SET age_category = "П"
WHERE id > 2;
SELECT * FROM cinema;

UPDATE cinema
SET age_category = "Д"
WHERE id = 3;
SELECT * FROM cinema;

# case
SELECT age_category, title,
CASE age_category
		WHEN "П" THEN "ПОДРОСТКОВАЯ"
		ELSE "Детская"
END AS result -- результат сохраняется в столбец с именем "result"
-- AS псевдоним 
FROM cinema;

-- AS имя_псевдонима
-- (условие, значение_для_истины, значение_для_лжи)
SELECT IF(100<200, "yes", "no") AS result ; -- Псевдоним "result"
