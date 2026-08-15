/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - To explore the structure of the database, including tables and schemas.
    - To inspect columns and metadata for specific tables.

Views Used:
    - information_schema.tables
    - information_schema.columns
===============================================================================
*/

-- Retrieve a list of all tables in the database
SELECT
    table_catalog,
    table_schema,
    table_name,
    table_type
FROM information_schema.tables
ORDER BY table_schema, table_name;


-- Retrieve all columns for a specific table (dim_customers)
SELECT
    column_name,
    data_type,
    is_nullable,
    character_maximum_length
FROM information_schema.columns
WHERE table_schema = 'gold'
  AND table_name = 'dim_customers'
ORDER BY ordinal_position;
