-- Skrypt do tworzenia niezbêdnych indeksów w ca³ej bazie.

USE Inventory2;

-- Indeksy klastrowane zosta³y utworzone na etapie tworzenia tabel (klucze g³ówne).
-- Tworzymy indeksy nieklastrowane na kolumny-klucze obce i kolumny, które bêd¹ najczêœciej wyszukiwane.
-- Tworzenie indeksów nieklastrowanych:
-- Employees
CREATE NONCLUSTERED INDEX ind_emp_1 on Employees(First_name, Last_name); -- czêsto wyszukiwane razem

-- Products
CREATE NONCLUSTERED INDEX ind_prod_1 on Products(Price, Cost); -- czêsto wyszukiwane razem
CREATE NONCLUSTERED INDEX ind_prod_2 on Products(Product_name, Product_group); -- czêsto wyszukiwane razem

-- Inventories
CREATE NONCLUSTERED INDEX ind_inv_1 on Inventories(EmployeeID); -- klucz obcy
CREATE NONCLUSTERED INDEX ind_inv_2 on Inventories(Inventory_start, Inventory_end); -- czêsto wyszukiwane razem

-- Deliveries
CREATE NONCLUSTERED INDEX ind_del_1 on Deliveries(ProductID); -- klucz obcy
CREATE NONCLUSTERED INDEX ind_del_2 on Deliveries(Product_count); -- czêsto wyszukiwane

-- Results
CREATE NONCLUSTERED INDEX ind_res_1 on Results(InventoryID, ProductID); -- klucz obcy
CREATE NONCLUSTERED INDEX ind_res_2 on Results(Product_count); -- czêsto wyszukiwane
