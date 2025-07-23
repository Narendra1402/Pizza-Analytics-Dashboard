# 🍕 Pizza Sales Analytics Project (Power BI + SQL)

This project is a complete **data analytics case study** using **SQL** and **Power BI** to uncover insights from a pizza delivery business. It covers everything from raw data exploration to KPI calculation and interactive dashboard visualization.

[🎥Explanation video](https://www.youtube.com/watch?v=gZAwoEfdMbs)

## 🧠 Project Overview

Using SQL, we explored and prepared insights from the raw dataset. Then, using Power BI, we visualized these insights in the form of interactive dashboards.

## 🚀 Tools & Technologies Used

| Tool      | Purpose                                  |
|-----------|------------------------------------------|
| **SQL Server** | Data exploration, metrics calculation |
| **Power BI Desktop** | Data modeling, DAX, and visual dashboards |
| **Power Query** | Data transformation and cleanup |
| **DAX** | KPIs and calculated columns for visuals |

## 📊 Dashboard Overview

<img width="914" height="495" alt="Capture1" src="https://github.com/user-attachments/assets/30cffb07-397b-4b0a-9a15-55068d8ca15b" />

### ✅ **Page 1: Sales Summary Dashboard**

This page provides a comprehensive overview of pizza sales performance.

**Key Metrics:**
- **Total Revenue**: $817.9K
- **Total Pizzas Sold**: 49,574
- **Total Orders**: 21,350
- **Avg. Quantity per Order**: 2.32
- **Avg. Order Value**: $38.31

**Visual Insights:**
- 📈 **Monthly Trend Sales**: Peak in July and August; dip in January and September.
- 📆 **Day Trend Sales**: Highest sales on Fridays, followed by Saturday and Thursday.
- ⏰ **Time Trend by Order**: Most orders occur between 12 PM - 6 PM.
- 🧀 **Distribution by Category**:
  - **Pizza Size**: Large (45.89%) dominates.
  - **Pizza Type**: Classic (26.91%) and Supreme (25.46%) are most preferred.



### 📌 **Page 2: Ranking-wise Analysis**

<img width="912" height="493" alt="Capture2" src="https://github.com/user-attachments/assets/6eb5772c-a2c8-4196-b58b-f0207ccc2748" />

Focuses on identifying the **Bottom 5 Pizzas** based on:
- **Revenue**
- **Quantity Sold**
- **Number of Orders**

**Key Observations:**
- **The Brie Carre Pizza** is the lowest in all three categories.
- **The Mediterranean Pizza** and **Spinach Supreme Pizza** appear consistently among the bottom performers.
- These results indicate potential areas for product improvement or marketing initiatives.


## 💡 Key Insights

- **Sales Trends**: Highest during mid-year months, especially on weekends.
- **Consumer Behavior**: Lunchtime and evening slots are peak hours.
- **Product Focus**: Large-sized pizzas dominate; smaller categories like X-Large and Brie Carre Pizza need strategic attention.
- **Marketing Opportunity**: Promotions around low-selling pizzas and low-traffic weekdays can help balance revenue.

## 📦 SQL Queries Used
Before building visuals in Power BI, we wrote and tested various SQL queries to uncover meaningful insights:

```sql
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
```

## 🧠 What I Learned

- Building dynamic dashboards using Power BI best practices.
- Designing user-friendly layouts with interactive slicers and ranking visuals.
- Gained hands-on experience with data storytelling using real-world metrics.

## 🔗 Connect With Me  
Feel free to explore more of my projects and reach out:  
- [LinkedIn](https://www.linkedin.com/in/narendrasingh1402)
- [YouTube](https://www.youtube.com/@Analyst_Hive)  
- [Portfolio](https://narendra1402.github.io/)


