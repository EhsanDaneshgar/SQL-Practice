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
