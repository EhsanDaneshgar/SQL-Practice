use [CPSY205];
-- Retrieves the employee(s) with the highest compensation in each department.
-- Uses a correlated subquery to compare each employee's compensation 
-- against the maximum compensation within their own department.

select DISTINCT [EmployeeID],[Department],[Compensation] from [dbo].[Employees] as e1
WHERE [Compensation] =(
	SELECT MAX ([Compensation]) FROM [dbo].[Employees] as e2
	where e1.[Department]=e2.[Department]);

--For each employee, show the EmployeeID, Department, and Hire Date
-- only if that employee works in a department where the average compensation is greater than 100,000.
--You cannot use AVG() directly in a WHERE clause. aggregate functions like AVG() must go inside a SELECT or HAVING clause, not WHERE.


SELECT EmployeeID, Department, [Hire Date]
FROM Employees
WHERE Department IN (
    SELECT Department
    FROM Employees
    GROUP BY Department
    HAVING AVG(Compensation) > 100000
);

-- HAVING is only needed when you want to apply a condition on aggregated values like COUNT, SUM, AVG, etc.
SELECT Department
FROM Employees
GROUP BY Department
HAVING COUNT(*)>6;

--If you only want to count how many people are in each department
select [Department],
count (*) as NumberOfEmployees
from [dbo].[Employees]
group by [Department];

-- "=" for only one certain condition
SELECT *
FROM Employees
WHERE Department = 'IT';

-- " IN" for a range of desired values
SELECT *
FROM Employees
WHERE Department IN ( 'IT', 'Finance');

--select the employees who just are working in sales department
SELECT [EmployeeID] FROM[dbo].[Employees]
WHERE [Department]='Sales'

SELECT *
FROM [CPSY205].[dbo].[Employees]
WHERE Department = 'Sales';

-- select employees whom compensation is higher than 100000
SELECT * from [dbo].[Employees]
where [Compensation]>100000;

--COUNTING the employees of each department
select COUNT([EmployeeID]) AS Number_of_Employees, [Department] from[dbo].[Employees]
group by [Department];

--average compensations of each department
SELECT AVG([Compensation]) AS Average_Compensation, [Department]FROM [dbo].[Employees]
GROUP BY [Department];
----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
USE[AdventureWorksDW2022];

SELECT TOP 5 * FROM [dbo].[DimEmployee];

SELECT FirstName, LastName, Title, DepartmentName
FROM DimEmployee
WHERE DepartmentName IN ('Marketing', 'Engineering', 'Finance');

--Query the list of FIRST and last names, title, and department  from DimEmployee 
--if the last name  have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
select FirstName, LastName, Title, DepartmentName
from DimEmployee
where 
    LEFT([LastName],1) IN ('A','I','O','U','E') AND
    RIGHT ([LastName],1) IN ('A','I','O','U','E');

--Query the EnglishProductName from the DimProduct table for all products whose ProductSubcategoryKey is not found in the DimProductSubcategory table.
SELECT [EnglishProductName]
FROM[dbo].[DimProduct]
WHERE[ProductSubcategoryKey] not in ( SELECT [ProductSubcategoryKey] FROM [dbo].[DimProductSubcategory]);

--Query the list of unique City names from the DimGeography table where the city name does not start with a vowel (a, e, i, o, u). Your result should not contain duplicates.

SELECT DISTINCT [City]
FROM[dbo].[DimGeography]
WHERE LEFT([City],1) NOT IN ('A','E','I','O','U');

--Find all products whose Color is either 'Red', 'Blue', or 'Black'.
--(Use the DimProduct table and the Color column)
SELECT [ProductKey],[EnglishProductName],[Color]
FROM [dbo].[DimProduct]
WHERE [Color] IN ('Red', 'Blue',  'Black');

--Select the first name, last name, and geography key of customers who belong to geography keys 22, 32, 42, 25, or 50.
select [FirstName],[MiddleName],[LastName],[GeographyKey]
from[dbo].[DimCustomer]
where [GeographyKey] IN (22,32,42,25,50);
