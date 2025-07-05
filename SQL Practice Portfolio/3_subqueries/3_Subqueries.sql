use [CPSY205];
  
  
-- Retrieves each employee's latest hire record (most recent Hire Date) 
-- by comparing within the same EmployeeID group.
-- Useful for filtering rehires or identifying the most current employment record per employee.
SELECT distinct [EmployeeID],[Department], [Hire Date]FROM [dbo].[Employees] as e1
 WHERE [Hire Date]=(
	SELECT MAX ([Hire Date]) FROM [dbo].[Employees] AS e2
	where e2.EmployeeID=e1.EmployeeID);
