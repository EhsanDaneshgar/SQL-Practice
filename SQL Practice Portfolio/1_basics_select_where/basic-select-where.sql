use [CPSY205];

--Selects the first 5 rows from the Employees table in the CPSY205 database
SELECT  top 5 * FROM [dbo].[Employees];

-- Retrieves the first 50 records from the Employees table,
SELECT TOP (50) [EmployeeID],
       [Age],
       [Department],
       [Compensation],
       [Hire Date]
FROM [CPSY205].[dbo].[Employees];

--Retrieves the names of all columns in the Employees table (metadata query)
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employees';


--all rows where the Department is either HR, IT, or Sales.
SELECT *
FROM [dbo].[Employees]
WHERE [Department] IN ('IT' , 'Sales');

-- Counts how many records exist for each EmployeeID in the Employees table.
SELECT [EmployeeID], COUNT(*) AS CountPerID FROM[dbo].[Employees]
GROUP BY [EmployeeID];

