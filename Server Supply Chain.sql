-- Use database 
use projects;
GO

SELECT DB_NAME() AS CurrentDatabase; -- (checking database)

SELECT name AS TableName FROM sys.tables ORDER BY name;-- (show tables in database)

-- Stock Table
Select * from Stocks;

-- Customer Table
Select * from Customer;

-- Understanding dataset structure 
SELECT TOP 10 * FROM Retail_Dataset;

-- count Rows
SELECT COUNT(*) AS TotalRows FROM Retail_Dataset;

-- count the Duplicate values from the dataset based on the Order_ID and Product_ID
SELECT Order_ID, Product_ID, COUNT(*) AS TimesRepeated FROM Retail_Dataset GROUP BY Order_ID, Product_ID HAVING COUNT(*) > 1;

-- Delete the duplicate values from the Table(Retail_Dataset)
WITH Duplicates AS (SELECT *,ROW_NUMBER() OVER (PARTITION BY Order_ID, Product_ID ORDER BY Order_ID) AS RowNum 
FROM Retail_Dataset)DELETE FROM Duplicates WHERE RowNum > 1;

-- Chechking is there any null values in the table
SELECT COUNT(*) AS Null_Values FROM Retail_Dataset WHERE Product_ID IS NULL and Order_ID IS NULL and 
Sales IS Null and Product_ID Is null and Quantity Is null;

-- Check is there any negative values in the table
SELECT * FROM Retail_Dataset WHERE Quantity <= 0 OR Sales <= 0;

-- Show Table Data
Select * from Retail_Dataset;




