-- 1)Show the first name, last name and telephone number for all the employees, except those who live in UK.

select *
from Employees

select FirstName, LastName, HomePhone, Country
from Employees
where Country <> 'UK' 

--2) Show all product details for products whose unit price is greater than $10
--and quantity in stock greater than 2. Sort by product price.

select *
from Products
where UnitPrice >= '10' and QuantityPerUnit >= '2'
order by UnitPrice

--3)Show the first name, last name and telephone number for the employees who started working in the company in 1992-1993.

select FirstName, LastName, HomePhone, HireDate
from Employees
where year(HireDate) between 1992 and 1993;

--4)Show the product name, Company name of the supplier and stock quantity of the products that have 15 or more items in stock and the Product name starts with B or C or M.

select ProductName, CompanyName, QuantityPerUnit, UnitsInStock
from Products P, Suppliers S
where P.SupplierID = S.SupplierID
and UnitsInStock >= 15 
and productname like 'M%' or productname like 'C%' or productname like 'B%' 

--5)Show all details for products whose Category Name is ' Meat/Poultry ' Or 'Dairy Products '. Sort them by product name.

select *
from Products P, Categories C
where C.CategoryID = P.CategoryID 
and CategoryName = 'Meat/Poultry' or CategoryName = 'Dairy Products'
order by ProductName

--6)Show Category name, Product name and profit for each product (how much money the company will earn if they sell all the units in stock). Sort by the profit.

select C.CategoryName, P.ProductName,(P.unitprice * unitsinstock * (1-Discount)) as 'Price*InSTock_Profit'
from Categories C, Products P, [Order Details] O
where C.CategoryID = P.CategoryID 
and P.ProductID = O.ProductID
order by 'Price*InSTock_Profit' DESC

--7)Show the Employees' first name, last name and Category Name of the products which they have sold (show each category once).

select distinct FirstName, LastName, CategoryName 
from Employees E, Orders O, [Order Details] OD, Products P, Categories C
where E.EmployeeID = O.EmployeeID 
and O.OrderID = OD.OrderID
and OD.ProductID = P.ProductID
and P.CategoryID = C.CategoryID


--8)Show the first name, last name, telephone number and date of birth for the employees who are aged older than 35. Order them by last name in descending order. 
select FirstName, LastName, HomePhone, BirthDate
from Employees
where (getdate()) - year(birthdate) > 35
order by LastName desc

--9)Show each employee’s name, the product name for the products that he has sold and quantity that he has sold.

select FirstName, SUM(OD.Quantity) as Amount_Sold
from Employees E, Orders O, [Order Details] OD, Products P
where E.EmployeeID = O.EmployeeID
and O.OrderID = OD.OrderID
and P.ProductID = OD.ProductID
group by FirstName


--10)Show for each order item – the customer name and order id, product name, ordered quantity, product price and total price (Ordered quantity * product price)
--and gap between ordered date and shipped date (the gap in days). Order by order id.

select OD.OrderID, CompanyName, ProductName, Quantity as 'Amount_Ordered', P.UnitPrice, (OD.Quantity * OD.UnitPrice) as 'total_price', DAY(O.OrderDate - O.ShippedDate) as 'gap_in_days'
from [Order Details] OD, Customers C, Products P, Orders O
where P.ProductID = OD.ProductID
and OD.OrderID = O.OrderID 
and C.CustomerID = O.CustomerID
order by OD.OrderID

--11)How much each customer paid for all the orders he had committed together?

select C.CustomerID, C.ContactName, SUM(O.OrderID) as 'total_orders', SUM(OD.Quantity * OD.UnitPrice) as 'Totall_paid'
from Customers C, [Order Details] OD, Orders O
where C.CustomerID = O.CustomerID
and O.OrderID = OD.OrderID
group by C.CustomerID, C.ContactName

--12)In which order numbers was the ordered quantity greater than 10% of the quantity in stock?

select OrderID, P.UnitsInStock, OD.Quantity
from [Order Details] OD, Products P
where P.ProductID = OD.ProductID
and OD.Quantity > (P.UnitsInStock * 0.1)

--13)Show how many Employees live in each country and their average age.

select Country, count(*) as 'live_in_each_country', AVG(DATEDIFF(YEAR, birthdate, GETDATE())) as 'AverageAge'
from Employees
group by Country

--14)What would be the discount for all the London customers (together),
--if after 5 days of gap between the order date and shipping date they get a 5% discount per item they bought?

select SUM(OD.Quantity * OD.UnitPrice * 0.05) as 'TotallDiscount'
from Customers C, Orders O, [Order Details] OD
where
C.CustomerID = O.CustomerID
and O.OrderID = OD.OrderID
and C.City LIKE 'Lo%'
and DATEDIFF(DAY, O.OrderDate, O.ShippedDate) >= 5

--15)Show the product id, name, stock quantity, price and total value (product price * stock quantity)
--for products whose total bought quantity is greater than 500 items.

select P.ProductID, ProductName, UnitsInStock, P.UnitPrice, (P.UnitsInStock * P.UnitPrice) as 'Total_Value'
from  Products P, [Order Details] OD
where P.ProductID = OD.ProductID
group by P.ProductID, ProductName, UnitsInStock, P.UnitPrice
having SUM(OD.Quantity) > '500'

--16)For each employee display the total price paid on all of his orders that hasn’t shipped yet.

select E.EmployeeID ,SUM(OD.Quantity * OD.UnitPrice) as 'TotallPrice'
from Employees E, Orders O, [Order Details] OD
where
E.EmployeeID = O.EmployeeID 
and O.OrderID = OD.OrderID
and O.ShippedDate is Null
group by E.EmployeeID

--17)For each category display the total sales revenue, every year.

select CategoryName, CAST(SUM(OD.Quantity * OD.UnitPrice * (1- OD.Discount)) AS DECIMAL(10, 2)) as 'sales', YEAR(O.OrderDate) as 'year'
from Categories C, Products P, [Order Details] OD, Orders O
where C.CategoryID = P.CategoryID
and P.ProductID = OD.ProductID
and O.OrderID = OD.OrderID
group by CategoryName, YEAR(O.OrderDate)
order by 'year'


--18)Which Product is the most popular? (number of items)

select TOP 1 ProductName, SUM(OD.Quantity) as 'AmountSold'
from [Order Details] OD, Products P
where P.ProductID = OD.ProductID
group by ProductName
order by 'AmountSold' DESC

--19)Which Product is the most profitable? (income)

select TOP 1 ProductName, SUM(Quantity * OD.UnitPrice) as 'TotallProfit'
from Products P, [Order Details] OD
where P.ProductID = OD.ProductID
group by ProductName
order by 'TotallProfit' DESC

--20)Display products that their price higher than the average price of their Category. 

select ProductName, CategoryName, P.UnitPrice
from Products P, Categories C
where P.CategoryID = C.CategoryID
and UnitPrice > (
select AVG(UnitPrice)
from Products as P2
where P2.CategoryID = P.CategoryID
group by CategoryID
)
order by CategoryName

--21)For each city (in which our customers live), display the yearly income average.

select city, YEAR(orderdate), AVG(UnitPrice * Quantity)
from Customers
join Orders on Orders.CustomerID = Customers.CustomerID
join [Order Details] on [Order Details].OrderID = Orders.OrderID
group by City, YEAR(OrderDate)
order by City


--22)For each month display the average sales in the same month all over the years. 

select DISTINCT MONTH(Orders.OrderDate) AS 'Months', YEAR(Orders.OrderDate) as 'MonthInYear', Sum(Quantity * UnitPrice)
from Orders
join [Order Details] on Orders.OrderID = [Order Details].OrderID
group by MONTH(Orders.OrderDate), YEAR(Orders.OrderDate)
order by Months

--23)Display a list of products and OrderID of the largest order ever placed for each product. 

select ProductName, orderID
from Products
join [Order Details] as OD1 on OD1.ProductID = Products.ProductID
where OD1.orderID = (
select top (1) OrderID
from [Order Details] as OD2
where OD2.ProductID = OD1.ProductID
order by Quantity DESC
)


--24)Display for each year, the customer who purchased the highest amount.%%%%%%%%%%%%%%%%% (could not solve.)

select YEAR(O.orderdate) as 'year', C.CustomerID, C.ContactName, SUM(OD.UnitPrice * OD.Quantity) as 'TotallAmount'
from Orders O, Customers C, [Order Details] OD
where C.CustomerID = O.CustomerID and O.OrderID = OD.OrderID
group by YEAR(O.orderdate), C.CustomerID, C.ContactName
having SUM(OD.UnitPrice * OD.Quantity) = 
(
 select MAX(TotalAmountPerYear)
 from
(
select YEAR(O2.OrderDate) AS 'Year', C2.CustomerID, SUM(OD2.UnitPrice * OD2.Quantity) as 'TotalAmountPerYear'
from Orders O2, Customers C2, [Order Details] OD2
where C2.CustomerID = O2.CustomerID and O2.OrderID = OD2.OrderID
group by   YEAR(O2.OrderDate), C2.CustomerID ) as 'YearlyTotal'

where 'Year' = YEAR(O.OrderDate)
)
order by YEAR(O.OrderDate)










