
--LESSON 1 HOMEWORK
--	Вывести название и стоимость товаров от 20 EUR.
SELECT ProductName, Price
FROM Products
WHERE
	Price >= 20
--Вывести страны поставщиков.
SELECT DISTINCT Country
FROM [Suppliers]
--	В упорядоченном по стоимости виде вывести название и стоимость товаров от всех поставщиков, кроме поставщика 1.
SELECT ProductName,	Price
FROM [Products]
WHERE 	SupplierID !=1
ORDER BY Price DESC
--Вывести контактные имена клиентов, кроме тех, что из France и USA.
SELECT ContactName
FROM [Customers]
WHERE Country !='France'AND
Country!='USA'


--LESSON 2 HOMEWORK

--Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT
		Products.ProductName,
    Products.Price * 1.07 AS Price_usd
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
ORDER BY Products.Price DESC
LIMIT 1

--Вывести два самых дорогих товара из категории Beverages из USA
SELECT *
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE
	Categories.CategoryName LIKE 'beverages'
	AND
	Suppliers.Country LIKE 'usa'
ORDER BY Products.Price DESC
LIMIT 2


-- Удалить товары с ценой менее 5 EUR
DELETE FROM Products
WHERE price < 5;

--Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT
	Suppliers.Country
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE
	Categories.CategoryName='Seafood'

--Очистить поле ContactName у всех клиентов не из China

UPDATE customers
SET ContactName = NULL
WHERE Country <> 'China';
