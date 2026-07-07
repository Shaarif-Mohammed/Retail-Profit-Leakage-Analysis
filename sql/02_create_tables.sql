/*
Project: Retail Profit Leakage & Discount Effectiveness Analysis
Purpose: Create dimension and fact tables
Schema:  retail
Author:  Shaarif Anas Mohammed
*/

/* Creating Date Dimension Table */

CREATE TABLE retail.dim_date (
    date_key INTEGER PRIMARY KEY,
    full_date DATE NOT NULL,
    year INTEGER NOT NULL,
    quarter INTEGER NOT NULL,
    month_number INTEGER NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    week_number INTEGER NOT NULL,
    day_name VARCHAR(20) NOT NULL
);

/* Creating Customer Dimension Table */ 

CREATE TABLE retail.dim_customer (
    customer_id VARCHAR(8) PRIMARY KEY,
    customer_name TEXT,
    segment TEXT
);

/*Creating Order Dimension Table */

CREATE TABLE retail.dim_order (
    order_id VARCHAR(14) PRIMARY KEY,
    ship_mode TEXT
);

/* Creating Product Dimension Table */

CREATE TABLE retail.dim_product (
    product_id VARCHAR(15) PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    sub_category TEXT
);

/* Creating Geography Dimension Table */

CREATE TABLE retail.dim_geography (
    geography_key SERIAL PRIMARY KEY,
    country TEXT,
    region TEXT,
    state TEXT,
    city TEXT,
    postal_code VARCHAR(20)
);

/* Creating Sales Fact Table */

CREATE TABLE retail.fact_sales (
    sales_id SERIAL PRIMARY KEY,
    order_id VARCHAR(14) NOT NULL,
    customer_id VARCHAR(8) NOT NULL,
    product_id VARCHAR(15) NOT NULL,
    geography_key INTEGER NOT NULL,
    order_date_key INTEGER NOT NULL,
    ship_date_key INTEGER NOT NULL,
    sales NUMERIC(12,2) NOT NULL,
    profit NUMERIC(12,2) NOT NULL,
    quantity INTEGER NOT NULL,
    discount NUMERIC(4,2) NOT NULL,

    CONSTRAINT fact_sales_order_id
        FOREIGN KEY (order_id)
        REFERENCES retail.dim_order (order_id),
        
    CONSTRAINT fact_sales_customer_id
        FOREIGN KEY (customer_id)
        REFERENCES retail.dim_customer (customer_id),

    CONSTRAINT fact_sales_product_id
        FOREIGN KEY (product_id)
        REFERENCES retail.dim_product (product_id),

    CONSTRAINT fact_sales_geography_key
        FOREIGN KEY (geography_key)
        REFERENCES retail.dim_geography (geography_key),

    CONSTRAINT fact_sales_order_date_key
        FOREIGN KEY (order_date_key)
        REFERENCES retail.dim_date (date_key),

    CONSTRAINT fact_sales_ship_date_key
        FOREIGN KEY (ship_date_key)
        REFERENCES retail.dim_date (date_key),

    CONSTRAINT discount_value
        CHECK (discount >= 0 AND discount <= 1)

);

