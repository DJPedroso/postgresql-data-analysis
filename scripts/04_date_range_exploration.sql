/*
===============================================================================
Date Range Exploration
===============================================================================
Purpose:
  - Determine the temporal boundaries of key data points.
  - Understand the range of historical data.

SQL Functions Used:
  - MIN(), MAX(), EXTRACT(), AGE()
*/

-- Determine the first and last order date and total duration in months
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    EXTRACT(YEAR FROM MAX(order_date)) - EXTRACT(YEAR FROM MIN(order_date)) AS order_range_years,
    (
        (EXTRACT(YEAR FROM MAX(order_date)) - EXTRACT(YEAR FROM MIN(order_date))) * 12
        + (EXTRACT(MONTH FROM MAX(order_date)) - EXTRACT(MONTH FROM MIN(order_date)))
    ) AS order_range_months
FROM gold.fact_sales;

-- Find the youngest and oldest customer based on birthdate
SELECT 
	MIN(birthdate) AS oldest_birthdate,
	EXTRACT(YEAR FROM AGE(CURRENT_DATE, MIN(birthdate))) AS oldest_age,
	MAX(birthdate) AS youngest_birthdate,
	EXTRACT(YEAR FROM AGE(CURRENT_DATE, MAX(birthdate))) AS youngest_age
FROM gold.dim_customers
