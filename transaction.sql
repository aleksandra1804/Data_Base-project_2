-- Skrypt z transakcj¹ na przetwarzanie danych.
USE Inventory2;

-- Podwy¿ka kosztów i cen produktów:
BEGIN TRANSACTION
-- podwy¿ka kosztów konkretnych produktów:
UPDATE Products set
Cost=Cost+0.12 where
ProductID=1
UPDATE Products set
Cost=Cost+0.09 where
ProductID=2
UPDATE Products set
Cost=Cost+0.1 where
ProductID=3
UPDATE Products set
Cost=Cost+0.05 where
ProductID=6
UPDATE Products set
Cost=Cost+0.04 where
ProductID=7
UPDATE Products set
Cost=Cost+0.05 where
ProductID=8
-- podwy¿ka cen grup produktów:
UPDATE Products set
Price=round(Price*1.05, 2) where
Product_group='Batoniki'
UPDATE Products set
Price=round(Price*1.02, 2) where
Product_group='S³odkie napoje'
COMMIT
