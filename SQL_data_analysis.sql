### Data Analysis in SQL.
# 1. Total Sales & Average Sales
SELECT 
    SUM(Sales) AS Total_Sales, 
    AVG(Sales) AS Avg_Sales
FROM sales_data;
 # This gives total revenue and average sales value.
 
#  2. Monthly Sales Trend
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month, 
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Month
ORDER BY Month;
# Helps identify seasonal trend

# 3.Top 10 Best-Selling Products
SELECT 
    Product_Name, 
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;
 # Finds the most profitable products.
 
 # 4.Top 10 Customers by Revenue
 SELECT 
    Customer_Name, 
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;
# Identifies high-value customers.

# 5.Sales by Category & Sub-Category
SELECT 
    Category, 
    Sub_Category, 
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category, Sub_Category
ORDER BY Total_Sales DESC;
#Shows which product categories perform best.

# 6. Sales by Region
SELECT 
    Region, 
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;
# Determines which regions drive the most revenue.

# 7.Impact of Shipping Mode on Sales
SELECT 
    Ship_Mode, 
    COUNT(Order_ID) AS Order_Count, 
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Ship_Mode
ORDER BY Total_Sales DESC;
# Checks if shipping method affects sales performance.



