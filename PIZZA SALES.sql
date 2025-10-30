create table Pizzas1
(
pizza_id	int,
order_id	int,
pizza_name_id	varchar(50),
quantity	int,
order_date	date,
order_time	time,
unit_price	float,
total_price	float,
pizza_size	varchar(50),
pizza_category	varchar(50),
pizza_ingredients	varchar(200),
pizza_name	varchar(50)
);


-- KPI REQUIREMENTS

-- 1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM PIZZAS1;


-- 2. Average Order Value
SELECT (SUM(TOTAL_PRICE) / COUNT(DISTINCT ORDER_ID)) AS AVG_ORDER_VALUE 
FROM PIZZAS1;

-- 3. Total Pizzas Sold
SELECT SUM(QUANTITY) AS TOTAL_PIZZA_SOLD FROM PIZZAS1;

-- 4. Total Orders
SELECT COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS FROM PIZZAS1;

-- 5. Average Pizzas Per Order
SELECT 
    ROUND(SUM(quantity) * 1.0 / COUNT(DISTINCT order_id), 2) AS Avg_Pizzas_per_order
FROM PIZZAS1;



-- CHARTS REQUIREMENTS

-- 1.Daily Trend for Total Orders
SELECT TO_CHAR(ORDER_DATE,'DAY') AS ORDER_DAY, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM PIZZAS1
GROUP BY TO_CHAR(ORDER_DATE,'DAY');

-- 2. Monthly Trend for Orders
SELECT TO_CHAR(ORDER_DATE,'MONTH') AS ORDER_DAY, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM PIZZAS1
GROUP BY TO_CHAR(ORDER_DATE,'MONTH');

-- 3. % of Sales by Pizza Category

SELECT 
  pizza_category,
  CAST(SUM(total_price) AS NUMERIC(10,2)) AS total_revenue,
  CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM PIZZAS1) AS NUMERIC(10,2)) AS pct
FROM PIZZAS1
GROUP BY pizza_category;


-- 4. % of Sales by Pizza Size
SELECT 
  pizza_size,
  CAST(SUM(total_price) AS NUMERIC(10,2)) AS total_revenue,
  CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM PIZZAS1) AS NUMERIC(10,2)) AS pct
FROM PIZZAS1
GROUP BY pizza_size
ORDER BY pizza_size;


-- 5.Total Pizzas Sold by Pizza Category
SELECT PIZZA_CATEGORY,
SUM(QUANTITY) AS TOTAL_QUANTITY_SOLD
FROM PIZZAS1
WHERE EXTRACT(MONTH FROM ORDER_DATE)=2
GROUP BY PIZZA_CATEGORY
ORDER BY TOTAL_QUANTITY_SOLD DESC;


-- 6.Top 5 Pizzas by Revenue
SELECT PIZZA_NAME,
SUM(TOTAL_PRICE) AS TOTAL_REVENUE
FROM PIZZAS1
GROUP BY PIZZA_NAME
ORDER BY TOTAL_REVENUE DESC
LIMIT 5;


-- 7.Bottom 5 Pizzas by Revenue

SELECT PIZZA_NAME,
SUM(TOTAL_PRICE) AS TOTAL_REVENUE
FROM PIZZAS1
GROUP BY PIZZA_NAME
ORDER BY TOTAL_REVENUE ASC
LIMIT 5;


-- 8.Top 5 Pizzas by Quantity
SELECT PIZZA_NAME,
SUM(QUANTITY) AS TOTAL_PIZZA_SOLD
FROM PIZZAS1
GROUP BY PIZZA_NAME
ORDER BY TOTAL_PIZZA_SOLD DESC
LIMIT 5;


-- 9. Bottom 5 Pizzas by Quantity

SELECT PIZZA_NAME,
SUM(QUANTITY) AS TOTAL_PIZZA_SOLD
FROM PIZZAS1
GROUP BY PIZZA_NAME
ORDER BY TOTAL_PIZZA_SOLD ASC
LIMIT 5;


-- 10.Top 5 Pizzas by Total Orders
SELECT PIZZA_NAME,
COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM PIZZAS1
GROUP BY PIZZA_NAME
ORDER BY TOTAL_ORDERS DESC
LIMIT 5;


-- 11.Bottom 5 Pizzas by Total Orders

SELECT PIZZA_NAME,
COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM PIZZAS1
GROUP BY PIZZA_NAME
ORDER BY TOTAL_ORDERS ASC
LIMIT 5;






SELECT *FROM PIZZAS1;