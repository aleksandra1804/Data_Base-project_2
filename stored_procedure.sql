-- Skrypt z procedur� sk�adow�.
USE Inventory2;

-- Procedura do wyznaczenia id i dodatkowych informacji o produktach dostarczonych po raz pierwszy 
-- po inwentaryzacji o zadanym id i przed kolejn� inwentaryzacj� (w szczeg�lno�ci po ostatniej inwentaryzacji).
-- Dodatkowe informacje: grupa produkt�w, nazwa, cena, koszt, data wa�no�ci.
-- Wyniki posortowane rosn�co wed�ug nazwy grupy produkt�w i nazwy produktu.

-- Dodatkowe za�o�enie do bazy danych: id kolejnych inwentaryzacji to kolejne liczby naturalne.

-- Jeden parametr - id inwentaryzacji.

-- Uzasadnienie zasadno�ci stworzenia procedury: Procedura wykonywana wielokrotnie - np. przed ka�d� inwentaryzacj�.

-- Procedura:
CREATE OR ALTER PROCEDURE New_Products @id int
AS 
BEGIN
	select b.Product_group, b.Product_name, a.ProductID, b.Price, b.Cost, b.Expiration_date
	from Deliveries a
	left join Products b on a.ProductID=b.ProductID
	where Delivery_date > (select Inventory_end from Inventories where InventoryID=@id) -- dostarczone po inwentaryzacji o danym id
	and Delivery_date < (select Inventory_start from Inventories where InventoryID=@id+1) -- i przed kolejn� inwentaryzacj�
	and a.ProductID not in (
		select distinct ProductID
		from Deliveries
		where Delivery_date <= (select Inventory_start from Inventories where InventoryID=@id)) -- i nie dostarczone przed inwentaryzacj� o danym id
END;

-- Przyk�ad u�ycia (dla innych parametr�w ni� 1 procedura nie zwraca rekord�w ze wzgl�du na ma�� liczb� rekord�w w tabelach):
-- EXEC New_Products 1;