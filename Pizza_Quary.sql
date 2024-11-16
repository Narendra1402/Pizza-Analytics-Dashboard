--select* from pizza_sales

--Total Revenue 
--select round(SUM(total_price),1) as Total_revenue from pizza_sales

--Average Order Value
--Select round(sum(total_price)/count(distinct(order_id)),1) as Average_order from pizza_sales

--Total Pizza Sold
--select sum(quantity) as Total_Pizza_Sold from pizza_sales

--Total Order 
--Select count(distinct(order_id)) as Total_Order from pizza_sales

--Average pizza per Order 
--SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))
--/ CAST(COUNT(DISTINCT(order_id)) AS DECIMAL (10,2)) AS DECIMAL(10,2)) FROM pizza_sales

--Daily Trend for total Order(weekly order report)
--SELECT DATENAME(DW, order_date) AS order_WeekDay ,COUNT(DISTINCT(order_id)) AS Total_Order
--FROM pizza_sales
--GROUP BY DATENAME(DW, order_date)


--monthly Trend for total order 
--SELECT DATENAME(MONTH, order_Date) as Month_Name , COUNT(DISTINCT(order_id)) AS Total_order
--FROM pizza_sales
--GROUP BY DATENAME(MONTH, order_Date)
--ORDER BY Total_order DESC


----% of Sales by Pizza Category for january month
--SELECT pizza_category, sum(total_price), ROUND(SUM(total_price)*100/(select sum(total_price) from pizza_sales where MONTH(order_date)= 1),2) as PCTotal_sales
--from pizza_sales
--where MONTH(order_date)= 1
--GROUP BY pizza_category


--% of sales by pizza sales for quarter 1

--SELECT pizza_size, ROUND(SUM(total_price),2) AS Total_Sales, CONCAT(ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART (quarter, order_date) = 1),2), '%' ) AS Percentage_Of_sales
--FROM pizza_sales
--WHERE DATEPART (quarter, order_date) = 1
--GROUP BY pizza_size
--ORDER BY Percentage_Of_sales DESC


--Top 5 best Seller by revenue 

--SELECT  TOP 5 pizza_name, SUM(total_price) AS Total_revenue  
--FROM pizza_sales 
--GROUP BY pizza_name
--ORDER BY Total_revenue DESC


--Bottom 5 best Seller by revenue 
--SELECT  TOP 5 pizza_name, SUM(total_price) AS Total_revenue  
--FROM pizza_sales 
--GROUP BY pizza_name
--ORDER BY Total_revenue ASC

--Top 5 best Seller by quantity  

--SELECT  TOP 5 pizza_name, SUM(quantity) AS Total_Quantity  
--FROM pizza_sales 
--GROUP BY pizza_name
--ORDER BY Total_Quantity DESC


--Bottom 5 best Seller by quantity  

--SELECT  TOP 5 pizza_name, SUM(quantity) AS Total_Quantity  
--FROM pizza_sales 
--GROUP BY pizza_name
--ORDER BY Total_Quantity ASC


--BOTTOM 5 best Seller by order 

--SELECT  TOP 5 pizza_name, COUNT(DISTINCT(order_id)) AS Total_order  
--FROM pizza_sales 
--GROUP BY pizza_name
--ORDER BY Total_order ASC