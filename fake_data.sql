-- Skrypt do wstawienia kilku rekordów do ka¿dej z tabel.

USE Inventory2

-- Wstawianie kilku rekordów do tabel:
-- Employees
INSERT INTO Employees (EmployeeID, First_name, Last_name, Title, Phone_number, Email, Current_Employee)
VALUES 
    (1,	'Weronika',	'Mach',	'Kasjer', '+48 550 444 900', NULL, 'False'),
    (2,	'Marek', 'Kasprzak', 'Sprzedawca', NULL, 'marek.kasprzak@wp.pl', 'True'),
	(3,	'Krzysztof', 'Pomidor', 'Menad¿er', NULL, NULL, 'False'),
	(4,	'Miros³aw',	'Mucha', 'Kasjer', NULL, NULL, 'True'),
	(5,	'Agnieszka', 'Boratyn',	'Sprzedawca', '+48 203 294 194', NULL, 'False'),
	(6,	'Zuzanna',	'Kapusta',	'Menad¿er', '+48 678 298 194', 'zuzanna.kapusta@gmail.com', 'True');

-- Products
INSERT INTO Products (ProductID, Product_name, Product_group, Price, Cost, Expiration_date)
VALUES 
    (1,	'Twix',	'Batoniki',	2.1500,	1.0300,	'2023-03-20'),
	(2,	'KitKat', 'Batoniki',	2.4000,	1.1000,	'2023-07-15'),
	(3,	'Grzesiek',	'Batoniki',	1.8000,	0.9200,	'2023-04-17'),
	(4,	'Cisowianka 0,5l', 'Woda',	1.7000,	0.7000,	NULL),
	(5,	'Cisowianka 1,5l', 'Woda',	2.3000,	0.9000,	NULL),
	(6,'Pepsi 0,5l', 'S³odkie napoje',	2.5000,	0.7000,	'2024-05-18'),
	(7,	'Pepsi 1,5l', 'S³odkie napoje',	3.5000,	1.2000,	'2024-06-01'),
	(8,	'Cappy pomarañczowy 0,5l', 'S³odkie napoje', 2.7000, 0.8300, '2023-01-31');

-- Inventories
INSERT INTO Inventories (InventoryID, EmployeeID, Inventory_start, Inventory_end)
VALUES 
    (1, 3, '2022-09-29 20:00:00.0000000 +02:00', '2022-09-30 03:30:00.0000000 +02:00'),
	(2, 3, '2022-12-28 20:00:00.0000000 +01:00', '2022-12-29 04:45:00.0000000 +01:00'),
	(3, 6, '2023-03-30 21:00:00.0000000 +02:00', '2023-03-31 04:15:00.0000000 +02:00'),
	(4, 6, '2023-06-27 21:00:00.0000000 +02:00', '2023-06-28 04:00:00.0000000 +02:00'),
	(5,	4, '2023-09-30 21:00:00.0000000 +02:00', '2023-10-01 05:00:00.0000000 +02:00');

-- Deliveries
INSERT INTO Deliveries (Delivery_date, ProductID, Product_count)
VALUES 
    ('2022-10-08 06:50:00.0000000 +02:00', 1, 150),
	('2022-10-08 06:50:00.0000000 +02:00', 2, 200),
	('2022-10-08 06:50:00.0000000 +02:00', 3, 180),
	('2022-10-10 06:40:00.0000000 +02:00', 5, 70),
	('2022-10-10 06:40:00.0000000 +02:00', 6, 120),
	('2022-10-10 06:40:00.0000000 +02:00', 7, 80),
	('2022-10-10 06:40:00.0000000 +02:00', 8, 100);

-- Results
INSERT INTO Results (InventoryID, ProductID, Product_count)
VALUES 
    (1,	1, 7),
	(1,	2, 15),
	(1,	3, 23),
	(1,	5, 3),
	(1,	6, 1),
	(1,	8, 17),
	(2,	1, 4);