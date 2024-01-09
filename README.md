# Data Base - Project 2

## Opis plików:
- *Inventory2.bak* - backup bazy danych,
- *create_database.sql* - skrypt do stworzenia bazy danych,
- *fake_data.sql* - skrypt do wczytania kilku rekordów do tabel,
- *transaction.sql* - skrypt z przykładową transakcją,
- *indexes.sql* - skrypt do utworzenia indeksów w bazie danych,
- *stored_procedure.sql* - skrypt z przykładową procedurą składową.
- 
## Opis bazy danych:
Baza danych zawiera informacje o inwentaryzacjach przeprowadzonych w małym sklepie. Baza składa się z tabel: 
* **Products** (informacje o produktach),
* **Inventories** (informacje o inwentaryzacjach),
* **Deliveries** (informacje o dostawach),
* **Results** (informacje o wynikach inwentaryzacji),
* **Employees** (informacje o pracownikach).

Założenia: 
* produkty nie są kradzione, nie giną itp., tzn. produkty, które były dostarczone, a nie ma ich na inwentaryzacji, zostały sprzedane,
* id inwentaryzacji to kolejne liczby naturalne.

## Opisy tabel:
### Products  - informacje o produktach,
a)	kolumny:
-	ProductID – id produktu,
-	Product_name – nazwa produktu,
- Product_group – grupa produktów,
- Price – cena za sztukę,
-	Cost – koszt za sztukę,
-	Expiration_date – data ważności.

b)	klucz główny: ProductID.

###	Inventories  - informacje o inwentaryzacjach,
a)	kolumny:
-	InventoryID – id inwentaryzacji,
-	EmployeeID – id pracownika opowiedzialnego za inwentaryzację,
-	Inventory_start – data początku inwentaryzacji,
-	Inventory_end –  data końca inwentaryzacji.

b) klucz główny: InventoryID.

###	Employees  - informacje o pracownikach,
a)	kolumny:
-	EmployeeID – id pracownika,
-	First_name – imię,
-	Last_name – nazwisko,
-	Title – stanowisko,
-	Phone_number – nr telefonu,
-	Emaile – email,
-	Current_employee – czy aktualny pracownik.
-	
b)	klucz główny: EmployeeID.

###	Results  - informacje o wynikach inwentaryzacji,
a) kolumny:
-	InvenoryID – id inventaryzacji,
-	ProductID – id produktu,
-	Product_count – naliczona liczba sztuk.

b)	klucz główny: InvenoryID, ProductID.

###	Delivries  - informacje o dostawach produktów,
a)	kolumny:
-	Delivery_date – data dostawy,
-	ProductID – id produktu,
-	Product_count – naliczona liczba sztuk.

b) klucz główny: Delivery_date, ProductID.

## Diagram bazy danych:

![Obraz1](https://github.com/aleksandra1804/Data_Base-project_2/assets/24977862/2c86a4be-2556-431c-9a11-4530074d9c93)
