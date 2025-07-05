use AdventureWorksDW2019;
--In the DimEmployee table, show the number of employees in each department.
--but only includes departments that have more than 10 employees.
SELECT [DepartmentName], COUNT(*) AS Number_of_Employees
FROM [dbo].[DimEmployee]
GROUP BY [DepartmentName]
Having count(*) >10;

-- This query returns the number of married employees ('M') in each department
 SELECT COUNT(*) AS MarriedCount, DepartmentName
FROM [dbo].[DimEmployee]
WHERE MaritalStatus = 'M'
GROUP BY DepartmentName;

--For each department, show the number of employees — only for departments with more than 10 employees.
SELECT [DepartmentName],COUNT([EmployeeKey]) AS Number_of_Employees
FROM[dbo].[DimEmployee]
GROUP BY[DepartmentName]
HAVING COUNT([EmployeeKey])>10
order by  COUNT([EmployeeKey]) DESC;

--Show departments where the average yearly income of employees is less than 50,000.
SELECT [DepartmentName],AVG([BaseRate]*37.5*52) as Average_Salary
FROM[dbo].[DimEmployee]
GROUP BY[DepartmentName]
HAVING AVG([BaseRate]*37.5*52)<50000;


--For each department, show the number of employees — but only include departments where the number of employees is an odd number.
SELECT [DepartmentName], COUNT([EmployeeKey])AS number_of_employees
FROM[dbo].[DimEmployee]
GROUP BY[DepartmentName]
HAVING (COUNT([EmployeeKey])%2=1);

--Show departments where the average hourly base rate (BaseRate) is between 20 and 40.
select [DepartmentName], AVG([BaseRate]) AS Average_Base_Rate FROM [dbo].[DimEmployee]
GROUP by[DepartmentName]
having AVG([BaseRate]) between 20 and 40;

--Show departments where the maximum BaseRate is greater than 60.
select [DepartmentName], MAX(BaseRate) as Max_Base_Rate
from [dbo].[DimEmployee]
group by [DepartmentName]
having MAX([BaseRate])>60;

--Show departments where the average birth year of employees is before 1985.
--(Hint: use YEAR(BirthDate))
select[DepartmentName], AVG(YEAR([BirthDate])) as average_birth_year_of_department_employees
from[dbo].[DimEmployee]
GROUP by[DepartmentName]
HAVING AVG(YEAR([BirthDate]))<1985;

--Write a SQL query to return the first and last names of customers, their city, and the total sales amount they generated 
--only for customers in the state of Washington — but only include those who made more than 3 purchases.

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




