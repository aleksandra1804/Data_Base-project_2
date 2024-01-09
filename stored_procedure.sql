-- Skrypt z procedur¹ sk³adow¹.
USE Inventory2;

-- Procedura do wyznaczenia id i dodatkowych informacji o produktach dostarczonych po raz pierwszy 
-- po inwentaryzacji o zadanym id i przed kolejn¹ inwentaryzacj¹ (w szczególnoœci po ostatniej inwentaryzacji).
-- Dodatkowe informacje: grupa produktów, nazwa, cena, koszt, data wa¿noœci.
-- Wyniki posortowane rosn¹co wed³ug nazwy grupy produktów i nazwy produktu.

-- Dodatkowe za³o¿enie do bazy danych: id kolejnych inwentaryzacji to kolejne liczby naturalne.

-- Jeden parametr - id inwentaryzacji.

-- Uzasadnienie zasadnoœci stworzenia procedury: Procedura wykonywana wielokrotnie - np. przed ka¿d¹ inwentaryzacj¹.

-- Procedura:
CREATE OR ALTER PROCEDURE New_Products @id int
AS 
BEGIN
	select b.Product_group, b.Product_name, a.ProductID, b.Price, b.Cost, b.Expiration_date
	from Deliveries a
	left join Products b on a.ProductID=b.ProductID
	where Delivery_date > (select Inventory_end from Inventories where InventoryID=@id) -- dostarczone po inwentaryzacji o danym id
	and Delivery_date < (select Inventory_start from Inventories where InventoryID=@id+1) -- i przed kolejn¹ inwentaryzacj¹
	and a.ProductID not in (
		select distinct ProductID
		from Deliveries
		where Delivery_date <= (select Inventory_start from Inventories where InventoryID=@id)) -- i nie dostarczone przed inwentaryzacj¹ o danym id
END;

-- Przyk³ad u¿ycia (dla innych parametrów ni¿ 1 procedura nie zwraca rekordów ze wzglêdu na ma³¹ liczbê rekordów w tabelach):
-- EXEC New_Products 1;