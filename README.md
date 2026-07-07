## Retail Profit Leakage & Discount Effectiveness Analysis

### Project Overview

This project investigates profit leakage within a retail business by analyzing sales performance, profitability, discounting behavior, regional trends, and historical business performance. Although the business generates strong overall revenue and remains profitable, significant losses exist beneath the surface due to a combination of product-level, discount-driven, and geographic factors.

Using SQL, PostgreSQL, Power BI, and DAX, this project transforms raw transactional data into an interactive analytical solution designed to identify loss drivers, quantify profit leakage, and support data-driven decision making.

---

### Business Problem

The business generated over **$2.33M in sales** and **$292K in profit**, yet still experienced approximately **$157K in gross losses** across products, orders, and regions.

Key business questions addressed include:

* Which products and categories generate the highest losses?
* How do discounts impact profitability?
* Which regions and states contribute most to profit leakage?
* Is profit leakage improving or worsening over time?
* What opportunities exist to improve profitability without increasing sales?

---

### Project Objectives

* Identify and quantify profit leakage across the business
* Evaluate the effectiveness of discounting strategies
* Analyze profitability across products, categories, and regions
* Monitor profitability trends using time intelligence
* Build an interactive Power BI dashboard for business stakeholders
* Deliver actionable business insights and recommendations

---

### Semantic Model

<img src="images/Semantic Model.png" width="1300">

The reporting solution is built using a star schema consisting of:

* Fact Sales
* Dim Customer
* Dim Product
* Dim Geography
* Dim Order
* Dim Date

The model supports scalable reporting, efficient filtering, and advanced DAX calculations.

---

### Dashboard Preview

**Executive Overview**

<img src="images/Executive Overview.png" width="1100">

**Profit Leakage Analysis**

<img src="images/Profit Leakage Analysis.png" width="1100">

**Discount Effectiveness Analysis**

<img src="images/Discount Effectiveness Analysis.png" width="1100">

**Regional Performance Analysis**

<img src="images/Regional Performance Analysis.png" width="1100">

**Time Intelligence Analysis**

<img src="images/Time Intelligence Trend Analysis.png" width="1100">

### Interactive Features

- **Synced Slicers**
  - Year
  - Region
  - Category
  - Maintain filter context across all report pages

- **Drill-Down Analysis**
  - Category → Subcategory loss analysis
  - Discount Bucket → Actual Discount analysis
  - Region → State performance analysis

- **Product Drillthrough Page**
  - Navigate directly from loss-making products to detailed product-level investigation
  - Analyze sales, profit, loss, discount exposure, regional performance, and transaction details
 
 <img src="images/Product Detail Analysis (Drill-Through).png" width="1100">

- **Custom Tooltips**
  - Discount analysis tooltip for subcategory performance
  - State-level performance tooltip within regional analysis

<p align="center">
    <img src="Images/Custom Tooltip 1.png" width="48%">
    <img src="Images/Custom Tooltip 2.png" width="48%">
</p>

- **Page Navigation Buttons**
  - Previous and Next navigation controls
  - Guided analytical workflow across report pages

- **Cross-Page Filtering**
  - Consistent analytical context maintained throughout the dashboard
  - Enables seamless movement between executive, operational, and detailed views

---

### Key Features

**Data Modeling**

* Star schema design
* Fact and dimension modeling
* Date dimension implementation
* Surrogate key management
* Data validation and integrity checks

**SQL Analysis**

* Data profiling
* Business KPI calculations
* Profitability analysis
* Discount analysis
* Regional performance analysis
* Trend analysis

**Power BI Development**

* Interactive dashboard design
* Drill-down analysis
* Product-level drillthrough page
* Custom tooltip pages
* Synced slicers
* Page navigation buttons
* Time intelligence reporting

 **DAX Measures**

* KPI calculations
* Profit leakage metrics
* Discount effectiveness metrics
* Customer and product analytics
* YTD analysis
* Prior-year analysis
* Year-over-Year comparisons


### Analytical Workflow

Executive Overview
→ Profit Leakage Analysis
→ Discount Effectiveness Analysis
→ Regional Performance Analysis
→ Time Intelligence Analysis
→ Product Detail Drillthrough

This layered approach allows users to move from high-level business performance indicators to transaction-level root cause analysis while maintaining a consistent analytical context throughout the report.

### Key Findings

* The business generated **$157.04K in gross losses** despite remaining profitable overall.
* Four subcategories (**Binders, Tables, Machines, and Bookcases**) accounted for approximately **72.3% of total losses**.
* Transactions receiving discounts above **30%** generated approximately **81.66% of all losses** while representing only **11.2% of sales**.
* Texas, Ohio, Pennsylvania, Illinois, and North Carolina contributed approximately **70.8% of total losses**.
* Losses increased from **$32.2K in 2023** to **$54.2K in 2026**, indicating that profit leakage is growing over time.

---

### Business Recommendations

* Strengthen discount governance for high-discount transactions.
* Review pricing strategies for high-loss product groups.
* Investigate underperforming regional markets.
* Expand profitability monitoring beyond traditional sales metrics.
* Align future growth initiatives with margin and profitability objectives.

---

### Technology Stack

| Category           | Tools        |
| ------------------ | ------------ |
| Database           | PostgreSQL   |
| Query Language     | SQL          |
| Data Visualization | Power BI     |
| Analytics          | DAX          |
| Version Control    | Git & GitHub |
| Documentation      | Markdown     |

---

### Repository Structure

Retail-Profit-Leakage-Analysis/
│
├── Data/
│   └── 01_superstore_dataset.csv
│
├── Docs/
│   ├── 01_business_requirements.md
│   ├── 02_data_assessment_report.md
│   ├── 03_sql_analysis_summary.md
│   ├── 04_schema_design.md
│   ├── 05_power_bi_semantic_model.md
│   ├── 06_dax_measures_documentation.md
│   ├── 07_power_bi_dashboard_design.md
│   ├── 08_analytical_findings.md
│   └── 09_key_insights_and_recommendations.md
│
├── Images/
│   ├── 01_semantic_model.png
│   ├── 02_executive_overview.png
│   ├── 03_profit_leakage_analysis.png
│   ├── 04_discount_effectiveness_analysis.png
│   ├── 05_regional_performance_analysis.png
│   ├── 06_time_intelligence_trend_analysis.png
│   ├── 07_product_detail_analysis_(drill-through).png
│   ├── 08_custom_tooltip-1.png
│   ├── 09_custom_tooltip-2.png

│
├── Notebooks/
│   └── 01_data_assessment.ipynb
│
├── PowerBI/
│   ├── 02_Retail-Profit-Leakage-Analysis-Theme.json
│   └── 01_Retail-Profit-Leakage-Analysis.pbix
│
├── Sql/
│   ├── 01_create_schema.sql
│   ├── 02_create_tables.sql
│   ├── 03_create&load_staging_table.sql
│   ├── 04_load_dimensions.sql
│   ├── 05_load_fact_table.sql
│   ├── 06_validate_data_loads.sql
│   └── 07_analysis_queries.sql
│
└── README.md


---

### Documentation

Detailed project documentation can be found in the `/docs` folder:

* Business Problem
* Data Assessment Report
* Data Model
* DAX Measures
* Dashboard Design & Navigation Guide
* Analytical Findings
* Key Insights & Recommendations

---

### Project Outcome

This project demonstrates an end-to-end analytics workflow, from raw transactional data and SQL-based analysis to dimensional modeling, DAX development, dashboard design, and executive-level business recommendations. The final solution provides stakeholders with a structured framework for identifying profit leakage, evaluating discount effectiveness, and improving profitability through data-driven decision making.
