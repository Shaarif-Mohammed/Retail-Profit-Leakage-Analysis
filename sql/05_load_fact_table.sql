/*
=========================================================
Project : Retail Profit Leakage & Discount Effectiveness Analysis
Database: retail_profit_analysis
Schema  : retail

Purpose:
Populate fact_sales from the staging table and dimension tables.

Source Table:
retail.stg_superstore

Target Fact Table:
retail.fact_sales

Notes:
- fact_sales is loaded at order-line grain.
- Direct business keys are taken from staging.
- geography_key is looked up from dim_geography.
- order_date_key and ship_date_key are generated from date values.
=========================================================
*/

INSERT INTO retail.fact_sales (
    order_id,
    customer_id,
    product_id,
    geography_key,
    order_date_key,
    ship_date_key,
    sales,
    profit,
    quantity,
    discount
)
SELECT
    s.order_id,
    s.customer_id,
    s.product_id,
    g.geography_key,
    TO_CHAR(s.order_date, 'YYYYMMDD')::INTEGER AS order_date_key,
    TO_CHAR(s.ship_date, 'YYYYMMDD')::INTEGER AS ship_date_key,
    s.sales,
    s.profit,
    s.quantity,
    s.discount
FROM retail.stg_superstore s
JOIN retail.dim_geography g
    ON s.country_region = g.country
    AND s.region = g.region
    AND s.state_province = g.state
    AND s.city = g.city
    AND s.postal_code = g.postal_code;

/*
=========================================================
Fact Table Load Complete 
*/