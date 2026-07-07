/*
=========================================================
Project : Retail Profit Leakage & Discount Effectiveness Analysis
Database: retail_profit_analysis
Schema  : retail

Purpose:
Develop SQL-based analytical queries to investigate
profit leakage, discount effectiveness, product performance,
customer segment performance, and regional profitability.
=========================================================
*/

/*
=========================================================
1. Executive KPI Summary

Purpose:
Calculate overall sales, profit, quantity sold, average
discount, and profit margin.
=========================================================
*/

SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    AVG(discount) AS average_discount,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin
FROM retail.fact_sales;

/*
=========================================================
2. Profitability by Product Category
=========================================================
*/

SELECT
    p.category,
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    SUM(f.quantity) AS total_quantity,
    SUM(f.profit) / NULLIF(SUM(f.sales), 0) AS profit_margin
FROM retail.fact_sales f
JOIN retail.dim_product p
    ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_profit DESC;

/*
=========================================================
3. Category Performance Analysis

Purpose:
Compare sales, profit, discount levels, and profit
margin across categories.
=========================================================
*/

SELECT
    p.category,
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    AVG(f.discount) AS average_discount,
    SUM(f.profit) / NULLIF(SUM(f.sales), 0) AS profit_margin
FROM retail.fact_sales f
JOIN retail.dim_product p
    ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY total_profit DESC;

/*
=========================================================
4. Sub-Category Profitability Analysis

Purpose:
Identify sub-categories driving profit leakage.
=========================================================
*/

SELECT
    p.category,
    p.sub_category,
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    AVG(f.discount) AS average_discount,
    SUM(f.profit) / NULLIF(SUM(f.sales), 0) AS profit_margin
FROM retail.fact_sales f
JOIN retail.dim_product p
    ON f.product_id = p.product_id
GROUP BY
    p.category,
    p.sub_category
ORDER BY total_profit ASC;

/*
=========================================================
5. Discount Effectiveness Analysis

Purpose:
Measure how profitability changes as discounts increase.
=========================================================
*/

WITH discount_analysis AS (

    SELECT
        CASE
            WHEN discount = 0 THEN 'No Discount'
            WHEN discount <= 0.10 THEN '0%-10%'
            WHEN discount <= 0.20 THEN '10%-20%'
            WHEN discount <= 0.30 THEN '20%-30%'
            ELSE '30%+'
        END AS discount_bucket,
        sales,
        profit

    FROM retail.fact_sales

)

SELECT
    discount_bucket,
    COUNT(*) AS orders,
    SUM(sales) AS total_sales,
    SUM(profit) / NULLIF(SUM(sales),0) AS total_profit
FROM discount_analysis
GROUP BY discount_bucket;

/*
=========================================================
6. Discount Exposure by Product Category and Sub-Category

Purpose:
Identify product groups receiving the highest discounts
and evaluate their impact on profitability.
=========================================================
*/

SELECT
    p.category,
    p.sub_category,
    AVG(f.discount) AS average_discount,
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    SUM(f.profit) / NULLIF(SUM(f.sales), 0) AS profit_margin

FROM retail.fact_sales f

JOIN retail.dim_product p
    ON f.product_id = p.product_id

GROUP BY
    p.category,
    p.sub_category

ORDER BY average_discount DESC;

/*
=========================================================
7. Top Loss-Making Products

Purpose:
Identify individual products contributing the most
to profit leakage.
=========================================================
*/

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category,
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    AVG(f.discount) AS average_discount,
    SUM(f.profit) / NULLIF(SUM(f.sales),0) AS profit_margin

FROM retail.fact_sales f

JOIN retail.dim_product p
    ON f.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category

ORDER BY total_profit ASC

LIMIT 10;

/*
=========================================================
7. Top Profit-Leaking Products

Purpose:
Measure contribution of loss-making products to
overall profit leakage.
=========================================================
*/

SELECT
    p.product_name,
    p.category,
    p.sub_category,
    SUM(f.profit) AS total_profit_loss

FROM retail.fact_sales f

JOIN retail.dim_product p
    ON f.product_id = p.product_id

WHERE f.profit < 0

GROUP BY
    p.product_name,
    p.category,
    p.sub_category

ORDER BY total_profit_loss ASC

LIMIT 20;

/*
=========================================================
8. Regional Profitability Analysis

Purpose:
Compare sales, profit, discount levels, and profit
margins across regions.
=========================================================
*/

SELECT
    g.region,
    SUM(f.sales) AS total_sales,
    SUM(f.profit) AS total_profit,
    AVG(f.discount) AS average_discount,
    SUM(f.profit) / NULLIF(SUM(f.sales),0) AS profit_margin

FROM retail.fact_sales f

JOIN retail.dim_geography g
    ON f.geography_key = g.geography_key

GROUP BY g.region

ORDER BY total_profit DESC;

/*
=========================================================
Analysis Complete

This script contains analytical queries developed to
explore sales performance, profitability, discount
behavior, product performance, and regional trends
within the retail data warehouse.

The queries in this file are intended to:
- Support exploratory data analysis (EDA)
- Validate business logic and calculations
- Identify areas for further investigation
- Serve as a foundation for Power BI reporting
  and dashboard development

Detailed findings, observations, business insights,
and recommendations are documented separately in the
project analysis and reporting artifacts.
=========================================================
*/