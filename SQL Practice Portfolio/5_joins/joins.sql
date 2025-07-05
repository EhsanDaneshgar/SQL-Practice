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

--Return the names of customers who are from the same city as customers with the LastName 'Smith'.
--Using a JOIN between DimCustomer and DimGeography

SELECT [FirstName],[MiddleName],[LastName]
FROM [dbo].[DimCustomer] AS C
JOIN [dbo].[DimGeography] AS G
ON C.GeographyKey=G.GeographyKey
WHERE G.City IN 
	(SELECT [City] FROM [dbo].[DimGeography] AS G2
	JOIN [dbo].[DimCustomer] AS C2 
		ON C2.GeographyKey=G2.GeographyKey
	WHERE C2.LastName='Smith');

--Returns a list of product names and their subcategory names
--Use tables: DimProduct and DimProductSubcategory
use [AdventureWorksDW2019];
SELECT PRODUCT.[EnglishProductName], SUB.[EnglishProductSubcategoryName]
FROM[dbo].[DimProduct] AS PRODUCT
JOIN  [dbo].[DimProductSubcategory] AS SUB
ON PRODUCT.ProductSubcategoryKey=SUB.ProductSubcategoryKey;

--Query the list of English product names and their corresponding category names
--from the DimProduct, DimProductSubcategory, and DimProductCategory tables.
--DimProduct.ProductSubcategoryKey → DimProductSubcategory.ProductSubcategoryKey
--DimProductSubcategory.ProductCategoryKey → DimProductCategory.ProductCategoryKey

SELECT product.[EnglishProductName], category.[EnglishProductCategoryName]
FROM [dbo].[DimProduct] as product
JOIN [dbo].[DimProductSubcategory] as sub
ON product.ProductSubcategoryKey = sub.ProductSubcategoryKey
join [dbo].[DimProductCategory] as category
on sub.ProductCategoryKey = category.ProductCategoryKey;

--Write a query to display the FirstName, LastName, and the City of each customer 
--by joining the DimCustomer and DimGeography tables.

SELECT C.[FirstName], C.LastName,  G.[City]
FROM [dbo].[DimCustomer] AS C
JOIN [dbo].[DimGeography] AS G
ON C.[GeographyKey]=G.GeographyKey;

--Write a query to return the FirstName, LastName, City, and StateProvinceName of customers 
--who live in the state of California.

SELECT C.[FirstName], C.LastName,  G.[City], G.[StateProvinceName]
FROM [dbo].[DimCustomer] AS C
JOIN [dbo].[DimGeography] AS G
ON C.[GeographyKey]=G.GeographyKey
WHERE [StateProvinceName]='California';


