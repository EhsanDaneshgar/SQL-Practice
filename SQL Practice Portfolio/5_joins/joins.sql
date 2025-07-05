--Write a SQL query to return the first and last names of customers, their city, and the total sales amount they generated 
-- only for customers in the state of Washington — but only include those who made more than 3 purchases.

USE [AdventureWorksDW2019];

SELECT MAX(C.[FirstName]) AS FirstName, 
	MAX(C.[LastName]) AS LastName,
	MAX(G.[City]) AS City, 
	sum(S.[SalesAmount]) as total_sales_amount, 
	MAX (G.StateProvinceName) AS State_Province_Name
FROM [dbo].[DimCustomer] AS C
JOIN [dbo].[DimGeography] AS G ON C.[GeographyKey]=G.[GeographyKey]
JOIN [dbo].[FactInternetSales] AS S ON S.[CustomerKey]=C.[CustomerKey]
WHERE G.StateProvinceName='Washington'
GROUP BY C.[FirstName], C.[LastName],G.[City],S.[CustomerKey],G.StateProvinceName 
having COUNT([SalesOrderNumber])>3;
