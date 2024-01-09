# Data_Base-project_2
## Opis bazy danych:
Baza danych zawiera informacje o inwentaryzacjach przeprowadzonych w małym sklepie. Baza składa się z tabel: 
* **Products** (informacje o produktach),
* **Inventories** (informacje o inwentaryzacjach),
* **Deliveries** (informacje o dostawach),
* **Results** (informacje o wynikach inwentaryzacji),
* **Employees** (informacje o pracownikach).\

Założenia: 
* produkty nie są kradzione, nie giną itp., tzn. produkty, które były dostarczone, a nie ma ich na inwentaryzacji, zostały sprzedane,
* id inwentaryzacji to kolejne liczby naturalne.

## Opisy tabel:
### Products  - informacje o produktach,
*	kolumny:
-	ProductID – id produktu,
-	Product_name – nazwa produktu,
- Product_group – grupa produktów,
- Price – cena za sztukę,
-	Cost – koszt za sztukę,
-	Expiration_date – data ważności.
*	klucz główny: ProductID.
###	Inventories  - informacje o inwentaryzacjach,
*	kolumny:
-	InventoryID – id inwentaryzacji,
-	EmployeeID – id pracownika opowiedzialnego za inwentaryzację,
-	Inventory_start – data początku inwentaryzacji,
-	Inventory_end –  data końca inwentaryzacji.
*	klucz główny: InventoryID.
###	Employees  - informacje o pracownikach,
*	kolumny:
-	EmployeeID – id pracownika,
-	First_name – imię,
-	Last_name – nazwisko,
-	Title – stanowisko,
-	Phone_number – nr telefonu,
-	Emaile – email,
-	Current_employee – czy aktualny pracownik.
*	klucz główny: EmployeeID.
###	Results  - informacje o wynikach inwentaryzacji,
* kolumny:
-	InvenoryID – id inventaryzacji,
-	ProductID – id produktu,
-	Product_count – naliczona liczba sztuk.
*	klucz główny: InvenoryID, ProductID.
###	Delivries  - informacje o dostawach produktów,
*	kolumny:
-	Delivery_date – data dostawy,
-	ProductID – id produktu,
-	Product_count – naliczona liczba sztuk.
*	klucz główny: Delivery_date, ProductID.

![Obraz1](https://github.com/aleksandra1804/Data_Base-project_2/assets/24977862/2c86a4be-2556-431c-9a11-4530074d9c93)


