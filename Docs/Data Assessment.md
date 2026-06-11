**DATA ASSESSMENT REPORT**

**Project**

**Retail Profit Leakage & Discount Effectiveness Analysis**

**Introduction**

The purpose of this assessment is to understand the structure, quality, and business meaning of the Sample Superstore dataset before designing a data model and implementing a SQL-based analytics solution.

This assessment focuses on:

- Dataset structure
- Data quality
- Data types
- Business entities
- Dataset grain
- Initial observations
- Modeling considerations

The findings from this document will be used to design the analytical database schema and Power BI semantic model.

**Dataset Overview**

**Dataset Information:**

This dataset has been taken from Kaggle. The name of the dataset is Sample Superstore Dataset. It contains over 10,000 retail sales records across multiple regions, product categories, and customer segments across North America.

It includes information such as sales, profit, discount, quantity, shipping details, customer details and product details. It has over 20 columns containing all information in one Sheet in .CSV format.

| **Attribute**     | **Value**                                                                                         |
| ----------------- | ------------------------------------------------------------------------------------------------- |
| Dataset Name      | Sample Superstore Dataset                                                                         |
| Source            | [Kaggle](https://www.kaggle.com/datasets/himanshuuike/superstore-sales-dataset?resource=download) |
| Number of Sheets  | 1                                                                                                 |
| Number of Rows    | 10194                                                                                             |
| Number of Columns | 21                                                                                                |
| File Format       | CSV                                                                                               |
| Assessment date   | June 8, 2026                                                                                      |

**Business Context:**

The dataset contains retail sales transactions and provides information related to:

- Orders
- Customers
- Products
- Shipping
- Geography
- Revenue
- Profitability
- Discounts

The dataset enables analysis of profit leakage, discount effectiveness, product performance, customer segments, and regional profitability.

**Dataset Grain:**

One row represents a single product line within an order.  
A single Order ID can appear multiple times in the dataset because one order may contain multiple products. This grain will drive the design of the fact table in the analytical model.

**Column Classification**

**Identifiers**  
\- Order ID  
\- Customer ID  
\- Product ID  
<br/>**Date Columns**  
\- Order Date  
\- Ship Date  
<br/>**Descriptive Attributes**

\-Customer Name  
\- Ship Mode  
\- Segment  
\- Country  
\- Region  
\- State  
\- City  
\- Postal Code  
\- Category  
\- Sub-Category  
\- Product Name  
<br/>**Measures**  
\- Sales  
\- Profit  
\- Quantity  
\- Discount

**Observations:**

- Most categorical and descriptive attributes were imported as Pandas object datatype, which is commonly used to represent string-based fields.
- Order Date and Ship Date were imported as object rather than datetime.
- Numeric measures were correctly identified as integer or floating-point values.

**Recommended Action**

- We would need to convert Order Date and Ship Date to proper date data types during preprocessing.

**Data Quality Assessment**

- No missing values were identified in the dataset.
- No duplicate records were identified at the dataset grain level.

**Data Profiling**

**Summary Statistics of Numerical columns:**

| **Measure**  | **Minimum** | **Maximum** | **Mean** | **Median** | **Std Deviation** |
| ------------ | ----------- | ----------- | -------- | ---------- | ----------------- |
| **Sales**    | 0.444       | 22638.480   | 228.22   | 53.910     | 619.906           |
| **Profit**   | \-6599.978  | 8399.976    | 28.67    | 8.690      | 232.465           |
| **Discount** | 0.00        | 0.80        | 0.155    | 0.20       | 0.206             |
| **Quantity** | 1.00        | 14          | 3.791    | 3.0        | 2.228             |

**Cardinality Analysis of Categorical Columns:**

| **Column name** | **Cardinality** |
| --------------- | --------------- |
| Ship Mode       | 4               |
| Segment         | 3               |
| Country         | 2               |
| Region          | 4               |
| State/Province  | 59              |
| City            | 542             |
| Category        | 3               |
| Sub-category    | 17              |
| Customer Name   | 800             |
| Product Name    | 1842            |

**Key Dimensions:**

| **Dimension (ID's)** | **Unique Values** |
| -------------------- | ----------------- |
| Customers            | 804               |
| Products             | 1862              |
| Orders               | 5111              |

**Dimension Cardinality Assessment:**

| **Entity** | **Unique ID's** | **Unique Names** |
| ---------- | --------------- | ---------------- |
| Customers  | 804             | 800              |
| Products   | 1862            | 1849             |

**Observation:**

The number of unique Customer IDs exceeds the number of unique Customer Names. Similarly, the number of unique Product IDs exceeds the number of unique Product Names. This indicates that business names are not guaranteed to be unique and confirms that Customer ID and Product ID should be used as the primary identifiers in the dimensional model.

**Initial Business Observations**

- Negative profit values are present within the dataset. This indicates that certain transactions generated losses despite producing revenue.
- Discounts range from 0% to 80%. This suggests significant variability in discounting practices and indicates that pricing strategy may be influencing profitability.
- Orders can contain multiple product lines. This confirms that the dataset operates at the order-line level and supports detailed product-level profitability analysis.
- Product hierarchy consists of 3 categories and 17 sub-categories. This structure supports category-level and sub-category-level profitability analysis.
- Customer segmentation is limited to three business segments, enabling comparison of profitability across customer types.

**Conclusion**

The dataset exhibits strong data quality with no missing values and no duplicate records. The data structure is suitable for dimensional modeling and supports analysis of profit leakage, discount effectiveness, customer behavior, product performance, and regional profitability.

The dataset exhibits sufficient dimensional characteristics to support a star schema design for analytical reporting. The next phase of the project will focus on designing and implementing a star schema in PostgreSQL followed by SQL-based business analysis and Power BI reporting.