/*
==================================================================
Create Database
==================================================================
Purpose:
  Creates a new database named 'data_warehouse'. If the database
  already exists, it is dropped and recreated.

WARNING:
  Running this script will drop the entire 'data_warehouse'
  database if it exists. All data in the database will be
  permanently deleted.
*/

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'data_warehouse'
  AND pid <> pg_backend_pid();

DROP DATABASE IF EXISTS data_warehouse;

CREATE DATABASE data_warehouse;
