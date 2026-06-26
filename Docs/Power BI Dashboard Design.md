## **Power BI Dashboard Design**
#### **Retail Profit Leakage and Discount Effectiveness Analysis**


### Overview

The Retail Profit Leakage & Discount Effectiveness Analysis dashboard was designed as an end-to-end analytical reporting solution focused on identifying, investigating, and monitoring profit leakage within a retail business environment.

Rather than functioning as a traditional sales reporting dashboard, the solution follows a structured analytical workflow that guides users from high-level business performance metrics to detailed root-cause analysis. The dashboard enables users to identify where losses occur, understand the relationship between discounting and profitability, evaluate geographic performance, and monitor profitability trends over time.

The reporting solution is designed around a business storytelling approach. Rather than presenting isolated metrics and charts, each page contributes to a structured analytical workflow that guides users from overall business performance toward increasingly detailed investigation and root-cause analysis.

### Dashboard Navigation Flow

The dashboard follows the analytical flow below:

Executive Overview

↓

Profit Leakage Analysis

↓

Discount Effectiveness Analysis

↓

Regional Performance Analysis

↓

Profitability Trend Analysis

↓

Product Detail Drillthrough

Each page builds upon insights discovered in the previous page, creating a logical investigative journey from summary metrics to detailed transaction-level analysis.

The dashboard follows a progressive analytical workflow.

Users begin with a high-level understanding of business performance before investigating specific profitability issues, discounting behavior, and regional performance differences and temporal behaviour of key metrics.

This structure mirrors the analytical process used during SQL exploration and supports both executive reporting and detailed business investigation.

### Page 1 - Executive Overview

The Executive Overview page serves as the primary entry point into the reporting solution.

Its objective is to provide an immediate assessment of overall business performance while establishing context for deeper analytical exploration throughout the dashboard.

<img src="../images/Executive Overview.png" width="1100">

**Key Questions Answered**

- How is the business performing overall?
- Which categories generate the most sales and profit?
- Which regions contribute the most revenue and profit?
- Which categories have stronger or weaker profit margins?
- How are sales and profit trending quarterly?

**KPI Cards**

- Total Sales
- Total Profit
- Total Loss
- Profit Margin %
- Average Discount %

**Visuals**

- Total Sales and Total Profit by Category
- Total Sales and Total Profit by Region
- Profit Margin % by Category
- Total Sales & Profit Trend Quarterly

### Page 2 - Profit Leakage Analysis

The Profit Leakage Analysis page directly addresses the primary business objective of the project.

Its purpose is to identify where profitability is being lost and determine which products, categories, and transactions contribute most significantly to negative financial outcomes.

<img src="../images/Profit Leakage Analysis.png" width="1100">

**Key Questions Answered**

- How much loss is the business generating?
- How much sales value is tied to loss-making transactions?
- Which products are the biggest loss contributors?
- Which categories are responsible for the highest loss exposure?
- Which discount levels are associated with losses?

**KPI Cards**

- Total Loss
- Loss Making Sales Value
- Loss Making Orders
- Loss Making Products
- Loss Making Transactions

**Visuals**

- Top 15 Loss Making Products (Drill-Through)
- Total Loss by Discount Bucket (Drill Down)
- Total Loss by Category (Drill Down)

### Page 3 - Discount Effectiveness Analysis

The Discount Effectiveness Analysis page evaluates the relationship between discounting behavior and profitability.

The page was designed to validate hypotheses generated during SQL analysis and determine whether current discounting practices support or undermine business performance.

<img src="../images/Discount Effectiveness Analysis.png" width="1100">

**Key Questions Answered**

- Which subcategories receive the highest average discounts?
- How does profit margin change across discount buckets?
- Are discounted sales generating profit or loss?
- Which discount levels create the greatest profitability risk?

**KPI Cards**

- Discounted Sales
- Discounted Profit
- Average Discount %
- Average Profit Margin %
- Units Sold at Discount

**Visuals**

- Profit Margin % by Discount Bucket
- Average Discount % by Sub Category
- Total Sales and Total Profit by Discount Bucket

### Page 4 - Regional Performance Analysis

The Regional Performance Analysis page evaluates business performance across geographic markets and investigates whether regional characteristics influence profitability outcomes.

<img src="../images/Regional Performance Analysis.png" width="1100">

**Key Questions Answered**

- Which states have the highest profit exposure?
- Which states create the greatest loss exposure?
- How do average discount and profit margin vary across regions?
- Where are geographic profitability risks concentrated?

**KPI Cards**

- Total Sales
- Total Profit
- Total Loss
- Profit Margin %
- Average Discount %

**Visuals**

- Avg Discount % & Profit Margin % by Region
- State wise Performance on Total Profit
- States with Highest Loss Exposure

### Page 5 - Time Intelligence Trend Analysis

Monitors profitability trends over time and evaluates whether profit leakage is improving or worsening.

<img src="../images/Time Intelligence Trend Analysis.png" width="1100">

**Key Questions Answered**

- Is profit leakage increasing over time?
- How do current YTD losses compare with prior year YTD losses?
- Are high-discount losses increasing?
- How are sales, profit, and loss changing year-over-year?
- How is profit margin trending across years?

**KPI Cards**

- YTD Loss
- Prior Year YTD Loss
- YoY Loss Growth %
- YTD Avg Discount %
- YoY Avg Discount Change %

**Visuals**

- YoY Change Sales, Profit and Loss
- YTD Loss and Prior Year YTD Loss by Year
- YTD Loss Comparison for 30%+ Discount Bucket
- Profit Margin % by Year