--В рамках БД "онлайн-магазин" напишите след/запросы:
--Найти мин/стоимость товаров для каждой категории
SELECT CategoryID, MIN(Price) AS min_price
FROM Products
GROUP BY CategoryID

--Вывести ТОП-3 стран по количеству доставленных заказов

SELECT
    Customers.Country,
    count(*) as amount_orders
FROM [Orders]
    join Customers on Orders.CustomerID = Customers.CustomerID
group by Customers.Country
order by amount_orders desc
    limit 3

--Вывести названия категорий, в которых более 10 товаров
SELECT Categories.CategoryName
FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
HAVING Products.ProductID > 10

--Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET Phone = ""
WHERE Country = 'USA'

--Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) AS total_orders
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.EmployeeID, Employees.FirstName, Employees.LastName
HAVING COUNT(Orders.OrderID) < 15

--Вывести товар, который находится на втором месте по ко-ву заказов
SELECT Products.ProductID
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductID
LIMIT 1 OFFSET 1
