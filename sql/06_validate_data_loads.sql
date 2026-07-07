/*
=========================================================
Project : Retail Profit Leakage & Discount Effectiveness Analysis
Database: retail_profit_analysis
Schema  : retail

Purpose:
Validate staging, dimension, and fact table loads.

Validation Focus:
- Row count checks
- Dimension count checks
- Fact table grain validation
- Foreign key lookup completeness
- Measure reconciliation
- Business rule checks
=========================================================
*/


/*
=========================================================
1. Row Count Validation

Purpose:
Confirm that the fact table has the same grain as the
staging table: one row per order line.
=========================================================
*/

SELECT 'stg_superstore' AS table_name, COUNT(*) AS row_count
FROM retail.stg_superstore

UNION ALL

SELECT 'fact_sales', COUNT(*)
FROM retail.fact_sales;


/*
Expected Result:
stg_superstore = 10,194
fact_sales     = 10,194
*/


/*
=========================================================
2. Dimension Count Validation

Purpose:
Confirm that dimension tables were populated with the
expected number of records.
=========================================================
*/

SELECT 'dim_customer' AS table_name, COUNT(*) AS row_count
FROM retail.dim_customer

UNION ALL

SELECT 'dim_order', COUNT(*)
FROM retail.dim_order

UNION ALL

SELECT 'dim_product', COUNT(*)
FROM retail.dim_product

UNION ALL

SELECT 'dim_geography', COUNT(*)
FROM retail.dim_geography

UNION ALL

SELECT 'dim_date', COUNT(*)
FROM retail.dim_date;


/*
Expected Results:
dim_customer  = 804
dim_order     = 5,111
dim_product   = 1,862
dim_geography = 655
dim_date      = Based on unique order and ship dates
*/


/*
=========================================================
3. Foreign Key Lookup Completeness

Purpose:
Confirm that all foreign key columns in fact_sales were
successfully populated during ETL.

Expected Result:
All checks should return 0.
=========================================================
*/

SELECT 'missing_order_id' AS validation_check, COUNT(*) AS issue_count
FROM retail.fact_sales
WHERE order_id IS NULL

UNION ALL

SELECT 'missing_customer_id', COUNT(*)
FROM retail.fact_sales
WHERE customer_id IS NULL

UNION ALL

SELECT 'missing_product_id', COUNT(*)
FROM retail.fact_sales
WHERE product_id IS NULL

UNION ALL

SELECT 'missing_geography_key', COUNT(*)
FROM retail.fact_sales
WHERE geography_key IS NULL

UNION ALL

SELECT 'missing_order_date_key', COUNT(*)
FROM retail.fact_sales
WHERE order_date_key IS NULL

UNION ALL

SELECT 'missing_ship_date_key', COUNT(*)
FROM retail.fact_sales
WHERE ship_date_key IS NULL;


/*
=========================================================
4. Measure Reconciliation

Purpose:
Confirm that business measures were not changed during
the ETL process from staging to fact table.

Expected Result:
Staging and fact totals should match.
=========================================================
*/

SELECT
    'staging' AS source_table,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    SUM(discount) AS total_discount
FROM retail.stg_superstore

UNION ALL

SELECT
    'fact_sales',
    SUM(sales),
    SUM(profit),
    SUM(quantity),
    SUM(discount)
FROM retail.fact_sales;


/*
=========================================================
5. Business Rule Validation

Purpose:
Check whether measure values fall within expected ranges.
=========================================================
*/

SELECT 'invalid_discount_values' AS validation_check, COUNT(*) AS issue_count
FROM retail.fact_sales
WHERE discount < 0
   OR discount > 1

UNION ALL

SELECT 'negative_sales_values', COUNT(*)
FROM retail.fact_sales
WHERE sales < 0

UNION ALL

SELECT 'non_positive_quantity_values', COUNT(*)
FROM retail.fact_sales
WHERE quantity <= 0;


/*
Expected Results:
invalid_discount_values     = 0
negative_sales_values       = 0
non_positive_quantity_values = 0
*/


/*
=========================================================
6. Date Key Validation

Purpose:
Confirm that date keys in the fact table exist in the
date dimension.
=========================================================
*/

SELECT 'missing_order_date_in_dim_date' AS validation_check, COUNT(*) AS issue_count
FROM retail.fact_sales f
LEFT JOIN retail.dim_date d
    ON f.order_date_key = d.date_key
WHERE d.date_key IS NULL

UNION ALL

SELECT 'missing_ship_date_in_dim_date', COUNT(*)
FROM retail.fact_sales f
LEFT JOIN retail.dim_date d
    ON f.ship_date_key = d.date_key
WHERE d.date_key IS NULL;


/*
Expected Result:
Both checks should return 0.
*/


/*
=========================================================
7. Geography Lookup Validation

Purpose:
Confirm that all geography keys in the fact table match
records in the geography dimension.
=========================================================
*/

SELECT COUNT(*) AS missing_geography_matches
FROM retail.fact_sales f
LEFT JOIN retail.dim_geography g
    ON f.geography_key = g.geography_key
WHERE g.geography_key IS NULL;


/*
Expected Result:
missing_geography_matches = 0
*/

/*
=========================================================
8.Date Dimension Coverage Validation

Purpose:
Confirm that every order_date and ship_date from the
staging table exists in dim_date.full_date.

Expected Result:
Both checks should return 0.
=========================================================
*/

SELECT 'missing_order_dates_in_dim_date' AS validation_check,
       COUNT(*) AS issue_count
FROM (
    SELECT DISTINCT order_date
    FROM retail.stg_superstore
) s
LEFT JOIN retail.dim_date d
    ON s.order_date = d.full_date
WHERE d.full_date IS NULL

UNION ALL

SELECT 'missing_ship_dates_in_dim_date',
       COUNT(*)
FROM (
    SELECT DISTINCT ship_date
    FROM retail.stg_superstore
) s
LEFT JOIN retail.dim_date d
    ON s.ship_date = d.full_date
WHERE d.full_date IS NULL;

/*
=========================================================
Validation Complete

If all expected results match, the ETL load is considered
successfully validated and ready for analytical SQL queries.
=========================================================
*/