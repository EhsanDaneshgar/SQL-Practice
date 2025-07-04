-- Query 1: Top 5 customers by total sales
SELECT TOP 5 [CustomerKey], SUM([SalesAmount]) AS total_sales
FROM [dbo].[FactInternetSales]
GROUP BY [CustomerKey]
ORDER BY total_sales DESC;

-- Query 2: Products sold in >4 territories with average price > 100
SELECT [ProductKey], COUNT(DISTINCT [SalesTerritoryKey]) AS TerritoryCount, AVG([UnitPrice]) AS AvgPrice
FROM [dbo].[FactInternetSales]
GROUP BY [ProductKey]
HAVING COUNT(DISTINCT [SalesTerritoryKey]) > 4 AND AVG([UnitPrice]) > 100;
