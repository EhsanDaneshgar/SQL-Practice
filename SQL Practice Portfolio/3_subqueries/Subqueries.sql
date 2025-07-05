use [CPSY205];
    
-- Retrieves each employee's latest hire record (most recent Hire Date) 
-- by comparing within the same EmployeeID group.
-- Useful for filtering rehires or identifying the most current employment record per employee.
SELECT distinct [EmployeeID],[Department], [Hire Date]FROM [dbo].[Employees] as e1
 WHERE [Hire Date]=(
	SELECT MAX ([Hire Date]) FROM [dbo].[Employees] AS e2
	where e2.EmployeeID=e1.EmployeeID);

--Retrieves the employee(s) with the highest compensation in each department.
--Uses a correlated subquery to compare each employee's compensation 
--against the maximum compensation within their own department.

SELECT DISTINCT [EmployeeID], [Department], [Compensation] 
FROM [dbo].[Employees] AS e1
WHERE [Compensation] = (
	SELECT MAX([Compensation]) 
	FROM [dbo].[Employees] AS e2
	WHERE e1.[Department] = e2.[Department]
);

--For each employee, show the EmployeeID, Department, and Hire Date
--only if that employee works in a department where the average compensation is greater than 100,000.
--You cannot use AVG() directly in a WHERE clause. aggregate functions like AVG() must go inside a SELECT or HAVING clause, not WHERE.

SELECT EmployeeID, Department, [Hire Date]
FROM Employees
WHERE Department IN (
    SELECT Department
    FROM Employees
    GROUP BY Department
    HAVING AVG(Compensation) > 100000
);

USE[AdventureWorksDW2022];

--Query the EnglishProductName from the DimProduct table for all products whose ProductSubcategoryKey is not found in the DimProductSubcategory table.
SELECT [EnglishProductName]
FROM[dbo].[DimProduct]
WHERE[ProductSubcategoryKey] not in ( SELECT [ProductSubcategoryKey] FROM [dbo].[DimProductSubcategory]);

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
