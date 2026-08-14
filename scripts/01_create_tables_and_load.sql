/*
==================================================================
Create Gold Schema, Tables, and Load Data
==================================================================
Purpose:
  Creates the 'gold' schema and its tables within the
  'data_warehouse' database. This script also loads data from
  CSV files into the Gold layer tables.

Tables Created:
  - gold.dim_customers
  - gold.dim_products
  - gold.fact_sales

Data Sources:
  - gold.dim_customers.csv
  - gold.dim_products.csv
  - gold.fact_sales.csv

WARNING:
  Running this script will create the Gold layer tables and load
  data from the specified CSV files. Existing tables with the
  same names must be removed or truncated before reloading data.
*/

-- ============================================================
-- Create Schema
-- ============================================================

CREATE SCHEMA IF NOT EXISTS gold;


-- ============================================================
-- Create Tables
-- ============================================================

CREATE TABLE gold.dim_customers (
    customer_key     INT,
    customer_id      INT,
    customer_number  VARCHAR(50),
    first_name       VARCHAR(50),
    last_name        VARCHAR(50),
    country          VARCHAR(50),
    marital_status   VARCHAR(50),
    gender           VARCHAR(50),
    birthdate        DATE,
    create_date      DATE
);


CREATE TABLE gold.dim_products (
    product_key      INT,
    product_id       INT,
    product_number   VARCHAR(50),
    product_name     VARCHAR(50),
    category_id      VARCHAR(50),
    category         VARCHAR(50),
    subcategory      VARCHAR(50),
    maintenance      VARCHAR(50),
    product_cost     INT,
    product_line     VARCHAR(50),
    start_date       DATE
);


CREATE TABLE gold.fact_sales (
    order_number     VARCHAR(50),
    product_key      INT,
    customer_key     INT,
    order_date       DATE,
    shipping_date    DATE,
    due_date         DATE,
    sales_amount     INT,
    quantity         SMALLINT,
    price             INT
);

TRUNCATE TABLE gold.dim_customers;

COPY gold.dim_customers
FROM 'C:/sql/sql-data-analytics-project/datasets/flat-files/gold.dim_customers.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);

TRUNCATE TABLE gold.dim_products;

COPY gold.dim_products
FROM 'C:/sql/sql-data-analytics-project/datasets/flat-files/gold.dim_products.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);

TRUNCATE TABLE gold.fact_sales;

COPY gold.fact_sales
FROM 'C:/sql/sql-data-analytics-project/datasets/flat-files/gold.fact_sales.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);
