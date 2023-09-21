--LESSON 3 HOMEWORK

--Вывести ко-во заказов, которое компания Speedy Express доставила в Brazil
SELECT
	COUNT(*) AS total_shipped_to_brazil
FROM Orders
JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE
		Shippers.ShipperName='Speedy Express'
    AND
    Customers.Country='Brazil'


--Вывести ко-во поставщиков не из UK и не из China
    SELECT COUNT(*) AS total_suppliers
    FROM Suppliers
    WHERE Country NOT IN ('UK', 'China')

--Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT
    AVG(Price) AS avg_price,
    MAX(Price) AS max_price,
    MIN(Price) AS min_price,
    COUNT(*) AS totalProducts_qty
FROM Products
WHERE CategoryID IN (3, 5)

--Вывести общую сумму проданных товаров
-- 386424.23 Answer
SELECT
SUM(Products.Price * OrderDetails.Quantity)
AS total_sales_amount
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
JOIN Products ON OrderDetails.ProductID=Products.ProductID


--Вывести ко-во стран, которые поставляют напитки
--12 answer
SELECT COUNT(*) AS countries_count
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Beverages'

--Вывести сумму, на которую было отправлено товаров клиентам в Germany
--47241.82000000001 Answer
SELECT
SUM(Products.Price * OrderDetails.Quantity)
AS total_sold_to_germany
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
JOIN Products ON OrderDetails.ProductID=Products.ProductID
WHERE Customers.Country='Germany'
