/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
  - Rank items (e.g., products, customers) based on performance or other metrics.
  - Identify top performers or laggards.

SQL Functions Used:
  - Aggregate Functions: SUM(), COUNT()
  - Window Functions: ROW_NUMBER()
  - Clauses: GROUP BY, ORDER BY, LIMIT
*/

-- Five products that generated the highest revenue
-- Simple Ranking
SELECT
	p.product_name,
	SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_products AS p
  ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- For subcategories: Using Window Functions
-- Complex Ranking
SELECT *
FROM (
	SELECT
		p.subcategory,
		SUM(f.sales_amount) AS total_revenue,
		ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
	FROM gold.fact_sales AS f
	LEFT JOIN gold.dim_products AS p
	  ON p.product_key = f.product_key
	GROUP BY p.subcategory
) AS ranked_subcategories
WHERE rank_products <= 5;

-- Five worst-performing products in terms of sales
SELECT
	p.product_name,
	SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_products AS p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC
LIMIT 5;

-- Top 10 customers who have generated the highest revenue
SELECT
	c.customer_key,
	c.first_name,
	c.last_name,
	COUNT(DISTINCT order_number) AS total_orders,
  SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
  ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Three customers with the fewest orders placed
SELECT
  c.customer_key,
  c.first_name,
  c.last_name,
  COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
  ON c.customer_key = f.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_orders ASC
LIMIT 3;
