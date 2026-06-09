**Schema Design Document**

**Project**

Retail Profit Leakage & Discount Effectiveness Analysis

**1\. Objective**

The purpose of this document is to define the dimensional model for the Retail Profit Leakage & Discount Effectiveness Analysis project.

The schema is designed to support SQL-based analysis and Power BI reporting for questions related to:

- Profit leakage
- Discount effectiveness
- Product profitability
- Customer segment performance
- Regional performance
- Time-based sales and profit trends

A star schema approach is used to separate measurable business transactions from descriptive business attributes.

**2\. Modeling Approach**

This project uses a star schema design.

A star schema contains:

- One central fact table
- Multiple dimension tables connected to the fact table
- Measures stored in the fact table
- Descriptive attributes stored in dimension tables

This design supports efficient aggregation, simplified reporting, and clear relationships for Power BI.

**3\. Dataset Grain**

The source dataset grain is:

One row represents one product line within an order.

This means that a single Order ID can appear multiple times when an order contains multiple products.

Because the dataset is at the order-line level, the fact table will also be designed at the order-line level.

**4\. Proposed Star Schema**

The analytical model will contain one fact table and five dimension tables.

**Fact Table**

- fact_sales

**Dimension Tables**

- dim_product
- dim_customer
- dim_order
- dim_geography
- dim_date

**5\. Fact Table Design**

**fact_sales**

The fact_sales table stores transactional sales records at the order-line level.

**Purpose**

This table captures the measurable business activity used for profitability and discount analysis.

**Columns**

| **Column**     | **Type**              | **Description**                                                    |
| -------------- | --------------------- | ------------------------------------------------------------------ |
| Sales_id       | Surrogate Primary Key | Acts as a Key identifier for each row in the fact table.           |
| order_id       | Foreign Key           | Links each transaction line to the order dimension                 |
| product_id     | Foreign Key           | Links each transaction line to the product dimension               |
| customer_id    | Foreign Key           | Links each transaction line to the customer dimension              |
| geography_key  | Foreign Key           | Links each transaction line to the geography dimension             |
| order_date_key | Foreign Key           | Links each transaction line to the date dimension using order date |
| ship_date_key  | Foreign Key           | Links each transaction line to the date dimension using ship date  |
| sales          | Measure               | Revenue generated from the transaction line                        |
| profit         | Measure               | Profit or loss generated from the transaction line                 |
| quantity       | Measure               | Number of units sold                                               |
| discount       | Measure               | Discount applied to the transaction line                           |

**Measures Stored in Fact Table**

- Sales
- Profit
- Quantity
- Discount

These fields are stored in the fact table because they are numeric business measures used for aggregation and analysis.

**6\. Dimension Table Design**

**dim_product**

The dim_product table stores product-related descriptive attributes.

**Columns**

| **Column**   | **Description**             |
| ------------ | --------------------------- |
| product_id   | Primary key for the product |
| product_name | Product name                |
| category     | Product category            |
| sub_category | Product sub-category        |

**Design Reasoning**

Product ID is used as the primary key because product names are not guaranteed to be unique. The data assessment showed that the number of unique Product IDs is greater than the number of unique Product Names.

Product category and sub-category are stored in this table because they describe the product.

**dim_customer**

The dim_customer table stores customer-related descriptive attributes.

**Columns**

| **Column**    | **Description**              |
| ------------- | ---------------------------- |
| customer_id   | Primary key for the customer |
| customer_name | Customer name                |
| segment       | Customer segment             |

**Design Reasoning**

Customer ID is used as the primary key because customer names are not guaranteed to be unique. The data assessment showed that the number of unique Customer IDs is greater than the number of unique Customer Names.

The Segment column belongs in the customer dimension because its values represent customer types, such as Consumer, Corporate, and Home Office.

**dim_order**

The dim_order table stores order-level descriptive attributes.

**Columns**

| **Column** | **Description**                  |
| ---------- | -------------------------------- |
| order_id   | Primary key for the order        |
| ship_mode  | Shipping mode used for the order |

**Design Reasoning**

Ship Mode describes the order rather than the product line. Since one order can contain multiple product lines, storing Ship Mode in an order dimension avoids unnecessary repetition in the fact table.

**dim_geography**

The dim_geography table stores location-related attributes.

**Columns**

| **Column**    | **Description**                     |
| ------------- | ----------------------------------- |
| geography_key | Surrogate primary key for geography |
| country       | Country or country/region           |
| region        | Sales region                        |
| state         | State or province                   |
| city          | City                                |
| postal_code   | Postal code                         |

**Design Reasoning**

Country, region, state, city, and postal code all describe geography. These attributes are grouped into one geography dimension because they represent the same business entity: location.

A surrogate geography_key is used instead of Postal Code because postal codes are descriptive location attributes and may not be reliable as unique primary keys across all geographic levels.

**dim_date**

The dim_date table stores calendar attributes for time-based analysis.

**Columns**

| **Column**  | **Description**          |
| ----------- | ------------------------ |
| date_key    | Primary key for the date |
| full_date   | Actual calendar date     |
| year        | Calendar year            |
| quarter     | Calendar quarter         |
| month       | Calendar month number    |
| month_name  | Calendar month name      |
| week_number | Week number              |
| day_name    | Day of week              |

**Design Reasoning**

A separate date dimension is used to support time intelligence, date hierarchy, drill-down analysis, and reusable calendar attributes in Power BI.

The fact table will connect to dim_date twice:

- order_date_key connects to dim_date.date_key
- ship_date_key connects to dim_date.date_key

This allows analysis by both order date and ship date.

**7\. Relationships**

The schema uses one-to-many relationships from dimension tables to the fact table.

| **Dimension Table** | **Primary Key** | **Fact Table Column** | **Relationship**                        |
| ------------------- | --------------- | --------------------- | --------------------------------------- |
| dim_product         | product_id      | product_id            | One product to many sales rows          |
| dim_customer        | customer_id     | customer_id           | One customer to many sales rows         |
| dim_order           | order_id        | order_id              | One order to many sales rows            |
| dim_geography       | geography_key   | geography_key         | One geography record to many sales rows |
| dim_date            | date_key        | order_date_key        | One date to many sales rows             |
| dim_date            | date_key        | ship_date_key         | One date to many sales rows             |

**8\. Power BI Modeling Considerations**

The schema is designed to support Power BI reporting.

Recommended Power BI model behavior:

- Use fact_sales as the central fact table.
- Use dimension tables for slicers and filters.
- Use one-to-many relationships from dimensions to fact.
- Use single-direction filtering from dimensions to fact.
- Use dim_date as the official date table.
- Use order_date_key as the primary date relationship for sales and profit trends.
- Use ship_date_key as a secondary date relationship when analyzing shipping timelines.

**9\. Future Enhancements**

Future improvements may include:

- Adding calculated business metrics such as profit margin and discount bands
- Creating SQL views for profitability analysis
- Creating SQL views for discount effectiveness analysis
- Adding a shipping delay metric using order date and ship date
- Extending the model for advanced analytics or predictive modeling

**10\. Conclusion**

This schema design provides a structured dimensional model for retail profitability analysis.

The model supports analysis across products, customers, orders, geography, and time. It also prepares the dataset for SQL implementation and Power BI reporting.

The next phase of the project will focus on implementing this schema in PostgreSQL.