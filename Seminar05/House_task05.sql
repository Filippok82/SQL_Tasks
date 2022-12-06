CREATE DATABASE house_task05;

USE house_task05;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE VIEW `new_view` AS
(SELECT *
FROM cars
WHERE Cost < 25000);


-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW new_view AS
SELECT *
FROM cars
WHERE Cost < 30000;

-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW `new_view_02` AS
(SELECT *
FROM cars
WHERE Name = "Audi" OR Name = "Skoda");


CREATE TABLE stations
(
	num INT NOT NULL,
    name_station VARCHAR(50),
    station_time time
);

INSERT stations
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00"),
    (110, "Palo Alto", "11:02:00" ),
    (110, "San Jose", "12:35:00"),
	(120, "San Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00" ), 
    (120, "San Jose", "13:30:00");
   
    
SELECT * FROM stations;


/* Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций.*/

SELECT *,
	LEAD(station_time) OVER (PARTITION BY num) as next_st,
	TIMEDIFF(LEAD(station_time) OVER (PARTITION BY num), station_time) AS time_next_station
FROM stations;




