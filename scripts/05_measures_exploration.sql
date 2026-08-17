/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Puprose:
  - Calculate aggregated metrics (e.g., totals, averages) for quick insights.
  - Identify overall trends or spot anomalies.

SQL Functions Used:
  - COUNT(), SUM()< AVG()
*/

-- Find the total sesal
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales

-- Find how many items are sold
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales

-- Find the average selling price
SELECT AVG(price) AS avg_price FROM gold.fact_sales

-- Find the total number of orders
SELECT
	COUNT(order_number) AS total_orders,
	COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales

-- Find the total # of products
SELECT 
	COUNT(product_key) AS total_products
FROM gold.dim_proudcts

-- Find the total # of customers
SELECT 
	COUNT(customer_key) AS total_customers
FROM gold.dim_customers;

-- Find the total number of custoemrs that has placed an order
SELECT 
	COUNT(DISTINCT customer_key) AS total_customers
FROM gold.fact_sales;

-- Generate a report that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total # of Products', COUNT(product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total # of Customers', COUNT(customer_key) FROM gold.dim_customers
