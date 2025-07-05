use [AdventureWorksDW2019];

-- Returns a list of order dates in SalesTerritoryKey 4,
-- along with the number of sales orders placed on each date.
-- Only includes dates with more than 1 sales order.
-- Results are sorted by OrderDate in descending order.

SELECT OrderDate, COUNT(SalesOrderLineNumber) AS Orders
FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
WHERE SalesTerritoryKey = 4
GROUP BY OrderDate
HAVING COUNT(SalesOrderLineNumber) > 1
ORDER BY OrderDate DESC;

-- Returns a list of order dates in SalesTerritoryKey 5,
-- along with the number of sales orders placed on each date.
-- Only includes dates with more than 2 sales orders.
-- Results are sorted by OrderDate in descending order.

SELECT [OrderDate],COUNT([SalesOrderLineNumber]) AS Orders
FROM [dbo].[FactInternetSales]
WHERE[SalesTerritoryKey]=5
GROUP BY[OrderDate]
HAVING COUNT([SalesOrderLineNumber])>2
ORDER BY [OrderDate] DESC;

--Query the number of products sold (ProductKey) per customer (CustomerKey). 
--Only return the customers who bought more than 5 different products.
--Sort the result by the number of products in descending order.

USE[AdventureWorksDW2019];
SELECT [CustomerKey], COUNT(DISTINCT([ProductKey])) AS Number_Of_Products_Bought
FROM [dbo].[FactInternetSales]
GROUP BY [CustomerKey]
HAVING COUNT(DISTINCT [ProductKey])>5
ORDER BY  COUNT(DISTINCT [ProductKey]) DESC;

--Write a query to find all product keys from the FactInternetSales table that were sold in more than 3 different sales territories. 
--Return the ProductKey and the number of distinct SalesTerritoryKey values they appear in. 
--Sort the result by this count in descending order.

SELECT [ProductKey], COUNT(DISTINCT [SalesTerritoryKey]) AS TerritoryCount
FROM [dbo].[FactInternetSales]
GROUP BY [ProductKey]
HAVING COUNT(DISTINCT [SalesTerritoryKey]) > 3
ORDER BY TerritoryCount DESC;

--List the SalesTerritoryKey values where the average UnitPrice is less than 300. 
--Show the average UnitPrice for each of those territories.

SELECT [SalesTerritoryKey], AVG ([UnitPrice]) AS the_average_UnitPrice
FROM[dbo].[FactInternetSales]
GROUP BY[SalesTerritoryKey]
HAVING AVG ([UnitPrice])<300;


--For each customer (CustomerKey), calculate the total sales. Only display those customers whose total sales exceed $5000. 
--Then show only the top 5 customers with the highest sales.
SELECT TOP 5 [CustomerKey],  SUM ([SalesAmount]) AS total_sales
FROM[dbo].[FactInternetSales]
GROUP BY [CustomerKey]
HAVING SUM ([SalesAmount])>5000
ORDER BY total_sales DESC;

--For each product (ProductKey), calculate the average unit price (UnitPrice). 
--Only display those products that have been sold in more than 4 different sales territories (SalesTerritoryKey) and have an average unit price greater than $100.

SELECT [ProductKey], AVG([UnitPrice]) AS the_average_unit_price,COUNT(DISTINCT([SalesTerritoryKey])) AS number_of_different_sales_territories
FROM[dbo].[FactInternetSales]
GROUP BY [ProductKey]
HAVING COUNT(DISTINCT([SalesTerritoryKey]))>4 AND AVG([UnitPrice])>100;

--Find products that were sold in at least 3 different years and had an average discount (DiscountAmount) of less than 50.
--Return: ProductKey, AVG(DiscountAmount) as average_discount, COUNT(DISTINCT YEAR(OrderDate)) as years_sold_in

SELECT [ProductKey], COUNT(DISTINCT(YEAR([OrderDate])) ) as years_sold_in, AVG(DiscountAmount) as average_discount
FROM[dbo].[FactInternetSales]
GROUP BY [ProductKey]
HAVING COUNT(DISTINCT(YEAR([OrderDate])) ) > 2 and AVG(DiscountAmount)<50;

--List customer IDs who bought more than 10 different products and spent over $10,000 in total.
--Return the customer key, number of distinct products bought, and total sales amount.

SELECT[CustomerKey],COUNT(DISTINCT([ProductKey])) AS number_of_different_products, SUM ([SalesAmount]) as total_sales_amount
FROM[dbo].[FactInternetSales]
GROUP BY [CustomerKey]
HAVING COUNT(DISTINCT([ProductKey]))>10 and SUM ([SalesAmount])>10000;

