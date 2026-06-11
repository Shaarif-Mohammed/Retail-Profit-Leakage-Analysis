/*
=========================================================
Project : Retail Profit Leakage & Discount Effectiveness Analysis
Database: retail_profit_analysis
Schema  : retail

Purpose:
Populate dimension tables from the staging table.

Source Table:
retail.stg_superstore

Target Dimension Tables:
- retail.dim_customer
- retail.dim_order
- retail.dim_product
- retail.dim_geography
- retail.dim_date

ETL Notes:
- Source data was first loaded into retail.stg_superstore.
- Dimension tables are populated using distinct source records.
- Customer, order, and geography dimensions are loaded using SELECT DISTINCT.
- Product dimension required additional handling because some product_id values
  were associated with more than one product_name in the source data.
- Since product_id is the primary key of dim_product, one representative
  product_name is selected using MIN(product_name).
=========================================================
*/


/*
=========================================================
1. Load Customer Dimension
Expected Count: 804
=========================================================
*/

INSERT INTO retail.dim_customer (
    customer_id,
    customer_name,
    segment
)
SELECT DISTINCT
    customer_id,
    customer_name,
    segment
FROM retail.stg_superstore;


/*
=========================================================
2. Load Order Dimension
Expected Count: 5,111
=========================================================
*/

INSERT INTO retail.dim_order (
    order_id,
    ship_mode
)
SELECT DISTINCT
    order_id,
    ship_mode
FROM retail.stg_superstore;


/*
=========================================================
3. Load Product Dimension
Expected Count: 1,862

Note:
The source data contains cases where the same product_id
is associated with more than one product_name.

Since product_id is used as the primary key, the ETL process
uses MIN(product_name) to select one representative product name
per product_id.
=========================================================
*/

INSERT INTO retail.dim_product (
    product_id,
    product_name,
    category,
    sub_category
)
SELECT
    product_id,
    MIN(product_name) AS product_name,
    MIN(category) AS category,
    MIN(sub_category) AS sub_category
FROM retail.stg_superstore
GROUP BY product_id;


/*
=========================================================
4. Load Geography Dimension
Expected Count: 655
=========================================================
*/

INSERT INTO retail.dim_geography (
    country,
    region,
    state,
    city,
    postal_code
)
SELECT DISTINCT
    country_region,
    region,
    state_province,
    city,
    postal_code
FROM retail.stg_superstore;


/*
=========================================================
5. Load Date Dimension

The date dimension is populated using both order_date and
ship_date from the staging table.

This ensures that all dates used in fact_sales are available
for foreign key relationships.
=========================================================
*/

INSERT INTO retail.dim_date (
    date_key,
    full_date,
    year,
    quarter,
    month_number,
    month_name,
    week_number,
    day_name
)
SELECT DISTINCT
    TO_CHAR(date_value, 'YYYYMMDD')::INTEGER AS date_key,
    date_value AS full_date,
    EXTRACT(YEAR FROM date_value)::INTEGER AS year,
    EXTRACT(QUARTER FROM date_value)::INTEGER AS quarter,
    EXTRACT(MONTH FROM date_value)::INTEGER AS month_number,
    TRIM(TO_CHAR(date_value, 'Month')) AS month_name,
    EXTRACT(WEEK FROM date_value)::INTEGER AS week_number,
    TRIM(TO_CHAR(date_value, 'Day')) AS day_name
FROM (
    SELECT order_date AS date_value
    FROM retail.stg_superstore

    UNION

    SELECT ship_date AS date_value
    FROM retail.stg_superstore
) d;

/*
=========================================================
Dimension Load Complete 
*/




