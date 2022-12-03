CREATE DATABASE house_task04;

USE house_task04;

CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);


-- 1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT c. id, c.name, s.shopname
FROM cats c 
INNER JOIN shops s ON c.id = s.id;


-- 2. Вывести магазин, в котором продается кот “Мурзик”
SELECT s.shopname
FROM shops s
INNER JOIN (
			SELECT *
            FROM cats
            WHERE name = "Murzik"
) c
ON  s.id = c.shops_id;

-- 3. Вывести магазины, в котором НЕ продаются коты “Мурзик” и “Zuza”
SELECT * FROM shops
WHERE id  NOT IN (SELECT shops_id FROM cats WHERE name = "Zuza" OR name = "Murzik")



