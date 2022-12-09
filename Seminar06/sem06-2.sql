DROP TABLE bankaccounts;
CREATE TABLE bankaccounts(accountno varchar(20) PRIMARY KEY NOT NULL, funds decimal(8,2));

INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);


START TRANSACTION;  -- Начало транзакции 
	UPDATE bankaccounts SET funds=funds-700 WHERE accountno='ACC1'; -- АСС1 - 700 (300)
	UPDATE bankaccounts SET funds=funds+700 WHERE accountno='ACC2';  -- АСС2 + 700 (1700)
COMMIT;  -- Сохранение ваших результатов

SELECT *
FROM bankaccounts;
