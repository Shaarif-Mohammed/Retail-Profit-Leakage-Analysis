/*
=========================================================
Project : Retail Profit Leakage & Discount Effectiveness Analysis
Database: retail_profit_analysis
Schema  : retail

Purpose:
Create a staging table to store raw source data from the
Sample Superstore CSV file.

The staging table mirrors the source file structure and
serves as the landing zone for the ETL process.

Data Flow:

CSV File
    ↓
retail.stg_superstore
    ↓
Dimension Tables
    - dim_customer
    - dim_product
    - dim_order
    - dim_geography
    - dim_date
    ↓
Fact Table
    - fact_sales

Design Notes:
- Staging tables contain raw source data.
- No primary keys are enforced.
- No foreign keys are enforced.
- No business rules or constraints are enforced.
- Data validation occurs during transformation into
  dimension and fact tables.
=========================================================
*/

CREATE TABLE retail.stg_superstore (

    /* Record Identifier */
    row_id INTEGER,

    /* Order Information */
    order_id VARCHAR(14),
    order_date DATE,
    ship_date DATE,
    ship_mode TEXT,

    /* Customer Information */
    customer_id VARCHAR(8),
    customer_name TEXT,
    segment TEXT,

    /* Geography Information */
    country_region TEXT,
    city TEXT,
    state_province TEXT,
    postal_code VARCHAR(20),
    region TEXT,

    /* Product Information */
    product_id VARCHAR(15),
    category TEXT,
    sub_category TEXT,
    product_name TEXT,

    /* Business Measures */
    sales NUMERIC(12,2),
    quantity INTEGER,
    discount NUMERIC(4,2),
    profit NUMERIC(12,2)

);

/*
=========================================================
Data Loading Notes

Source File:
Sample Superstore Dataset (.csv)

Load Method:
pgAdmin Import/Export Tool

Import Settings:
- Format: CSV
- Header: Yes
- Delimiter: ,
- Quote: "
- Escape: "
- Encoding: UTF8

Validation Results:
- Records Loaded: 10,194
- Distinct Customers: 804

Notes:
During initial import, PostgreSQL raised an
"unterminated CSV quoted field" error.

The issue was resolved by configuring the Escape
character setting to use double quotes (").
=========================================================
*/