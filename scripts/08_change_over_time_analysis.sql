/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
  - Track trends, growth, and changes in key metrics over time.
  - Time-series analysis and identifying seasonality.
  - Measure growth or decline over specific periods.
SQL Functions Used:
  - Date Functions: EXTRACT(), DATE_TRUNC()
  - Aggregate Functions: SUM(), COUNT()
*/


-- Analyze sales performance over time (e.g. Year, Month, etc.)

-- Quick Date Functions
SELECT
	EXTRACT(YEAR FROM order_date) AS order_year,
	EXTRACT(MONTH FROM order_date) AS order_month,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date) ASC;

-- DATE_TRUNC:
SELECT
	DATE_TRUNC('month', order_date) AS order_month,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date) ASC;
