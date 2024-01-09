-- Skrypt do tworzenia bazy danych, tabel, kluczy g³ównych i obcych, ograniczeñ na kolumny itd.

-- Tworzenie bazy danych:
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Inventory2')
BEGIN
    CREATE DATABASE Inventory2;
END;

USE Inventory2;

-- Tworzenie tabel:
-- Employees
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Employees')
BEGIN
    CREATE TABLE Employees (
        EmployeeID int NOT NULL,
        First_name varchar(30) NOT NULL,
        Last_name varchar(30) NOT NULL,
        Title nvarchar(50),
        Phone_number nvarchar(20),
		Email varchar(50),
		Current_Employee bit NOT NULL,
        PRIMARY KEY CLUSTERED (EmployeeID)
    );
END;

-- Products
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Products')
BEGIN
    CREATE TABLE Products (
        ProductID int NOT NULL,
        Product_name nvarchar(50) NOT NULL,
        Product_group nvarchar(50) NOT NULL,
        Price money NOT NULL,
        Cost money NOT NULL,
		Expiration_date date,
        PRIMARY KEY CLUSTERED (ProductID)
    );
END;

-- Inventories
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Inventories')
BEGIN
    CREATE TABLE Inventories (
		InventoryID int NOT NULL,
        EmployeeID int NOT NULL,
        Inventory_start datetimeoffset(7) NOT NULL,
		Inventory_end datetimeoffset(7) NOT NULL,
        PRIMARY KEY CLUSTERED (InventoryID),
		CONSTRAINT FK_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
    );
END;

-- Deliveries
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Deliveries')
BEGIN
    CREATE TABLE Deliveries (
		Delivery_date datetimeoffset(7) NOT NULL,
        ProductID int NOT NULL,
        Product_count int NOT NULL,
        PRIMARY KEY CLUSTERED (Delivery_date, ProductID),
		CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    );
END;

-- Results
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Results')
BEGIN
    CREATE TABLE Results (
        InventoryID int NOT NULL,
        ProductID int NOT NULL,
        Product_count int NOT NULL,
        PRIMARY KEY CLUSTERED (InventoryID, ProductID),
		CONSTRAINT FK_InventoryID FOREIGN KEY (InventoryID) REFERENCES Inventories(InventoryID),
		CONSTRAINT FK_ProductID_AddInfo FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    );
END;
