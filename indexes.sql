-- Skrypt do tworzenia niezb�dnych indeks�w w ca�ej bazie.

USE Inventory2;

-- Indeksy klastrowane zosta�y utworzone na etapie tworzenia tabel (klucze g��wne).
-- Tworzymy indeksy nieklastrowane na kolumny-klucze obce i kolumny, kt�re b�d� najcz�ciej wyszukiwane.
-- Tworzenie indeks�w nieklastrowanych:
-- Employees
CREATE NONCLUSTERED INDEX ind_emp_1 on Employees(First_name, Last_name); -- cz�sto wyszukiwane razem

-- Products
CREATE NONCLUSTERED INDEX ind_prod_1 on Products(Price, Cost); -- cz�sto wyszukiwane razem
CREATE NONCLUSTERED INDEX ind_prod_2 on Products(Product_name, Product_group); -- cz�sto wyszukiwane razem

-- Inventories
CREATE NONCLUSTERED INDEX ind_inv_1 on Inventories(EmployeeID); -- klucz obcy
CREATE NONCLUSTERED INDEX ind_inv_2 on Inventories(Inventory_start, Inventory_end); -- cz�sto wyszukiwane razem

-- Deliveries
CREATE NONCLUSTERED INDEX ind_del_1 on Deliveries(ProductID); -- klucz obcy
CREATE NONCLUSTERED INDEX ind_del_2 on Deliveries(Product_count); -- cz�sto wyszukiwane

-- Results
CREATE NONCLUSTERED INDEX ind_res_1 on Results(InventoryID, ProductID); -- klucz obcy
CREATE NONCLUSTERED INDEX ind_res_2 on Results(Product_count); -- cz�sto wyszukiwane
