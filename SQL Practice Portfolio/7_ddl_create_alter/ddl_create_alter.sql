-- Switches to the West_OIlfield database to execute the following table creation.
USE [West_OIlfield];

-- Creates a table named 'wells' with two columns:
-- well_ID as the primary key and well_name as a variable-length string (up to 55 characters).
create table wells (
well_ID int PRIMARY KEY,
well_name varchar (55)
);

-- Switches to the CPSY205 database to create or modify tables.
USE CPSY205;

-- Creates a new table named 'Customers' with a single column 'CustomerID' of type INT.
CREATE TABLE dbo.Customers(
CustomerID INT);

-- Alters the 'Customers' table to add three new columns:
-- FirstName and LastName as NVARCHAR(50), and Email as NVARCHAR(100).
ALTER TABLE [dbo].[Customers]
ADD FirstName NVARCHAR (50),
	LastName NVARCHAR (50),
	Email NVARCHAR(100);
