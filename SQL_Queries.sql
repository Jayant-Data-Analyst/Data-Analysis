create database sales_database;
# 1. finds out directory from which data files can be loaded
SHOW VARIABLES LIKE 'secure_file_priv';

### creating and loading data
# 2. creates table named sales_data along with its fields
CREATE TABLE sales_data (
    Row_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID VARCHAR(50),
    Order_Date date,  
    Ship_Date date,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales decimal(10,4)
);


# 3.loads csv data in table and changes format of Order_date  and Ship_date row.
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sales_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS
(Row_ID,Order_ID, @Order_Date, @Ship_Date, Ship_Mode, Customer_ID, Customer_Name, Segment, Country, City, State, Postal_Code, Region, Product_ID, Category, Sub_Category, Product_Name, Sales)
SET
	Order_Date = STR_TO_DATE(@Order_Date, '%d/%m/%Y'),
	Ship_Date = STR_TO_DATE(@Ship_Date, '%d/%m/%Y');

### verifying and checking data
# 4.Verifies Data Import
select * from sales_data;

# 5.checks total number of rows in table
SELECT COUNT(*) FROM sales_database.sales_data;

# 6.checks total number of columns
SELECT COUNT(*) AS NumberOfColumns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'sales_database'
  AND table_name = 'sales_data';
  
# 7.Verify Data Types
DESCRIBE sales_data;


