-- View raw data
SELECT * FROM pizza_sales;

-- Total Revenue
SELECT ROUND(SUM(total_price), 1) AS Total_revenue FROM pizza_sales;

-- Average Order Value
SELECT ROUND(SUM(total_price)/COUNT(DISTINCT(order_id)), 1) AS Average_order FROM pizza_sales;

-- Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;

-- Total Order
SELECT COUNT(DISTINCT(order_id)) AS Total_Order FROM pizza_sales;

-- Average Pizza per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
            CAST(COUNT(DISTINCT(order_id)) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
FROM pizza_sales;

-- Day Trend for Total Order (Weekly)
SELECT DATENAME(DW, order_date) AS order_WeekDay, 
       COUNT(DISTINCT(order_id)) AS Total_Order
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

-- Monthly Trend for Total Order
SELECT DATENAME(MONTH, order_date) AS Month_Name, 
       COUNT(DISTINCT(order_id)) AS Total_order
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_order DESC;

-- % of Sales by Pizza Category for January
SELECT pizza_category, 
       SUM(total_price) AS Total_Sales,
       ROUND(SUM(total_price)*100 / 
             (SELECT SUM(total_price) 
              FROM pizza_sales 
              WHERE MONTH(order_date)=1), 2) AS PCTotal_sales
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category;

-- % of Sales by Pizza Size for Q1
SELECT pizza_size, 
       ROUND(SUM(total_price),2) AS Total_Sales, 
       CONCAT(ROUND(SUM(total_price)*100 / 
              (SELECT SUM(total_price) 
               FROM pizza_sales 
               WHERE DATEPART(QUARTER, order_date)=1), 2), '%') AS Percentage_Of_sales
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date)=1
GROUP BY pizza_size
ORDER BY Percentage_Of_sales DESC;

-- Top 5 Best Sellers by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_revenue  
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_revenue DESC;

-- Bottom 5 by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_revenue  
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_revenue ASC;

-- Top 5 Best Sellers by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity  
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Quantity DESC;

-- Bottom 5 by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity  
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Quantity ASC;

-- Bottom 5 by Order Count
SELECT TOP 5 pizza_name, COUNT(DISTINCT(order_id)) AS Total_order  
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY Total_order ASC;
