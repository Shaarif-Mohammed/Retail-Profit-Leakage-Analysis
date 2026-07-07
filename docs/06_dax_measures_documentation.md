## **DAX Measure Framework Documentation**
#### **Retail Profit Leakage and Discount Effectiveness Analysis**
---

### Overview

Following the implementation and validation of the Power BI semantic model, a dedicated DAX measure framework was developed to serve as the analytical calculation layer for the reporting solution.

The objective of this phase was to establish a centralized, reusable, and scalable collection of business calculations that support KPI reporting, profitability analysis, discount evaluation, and profit leakage investigation.

Rather than relying on implicit aggregations generated within report visuals, explicit DAX measures were created to ensure calculation consistency, improve maintainability, and support future analytical expansion.

The measure framework forms the foundation for all report pages, visualizations, business metrics, and executive dashboards developed during subsequent phases of the project.

---

### Introduction

Measures are dynamic calculations written in Data Analysis Expressions (DAX) and evaluated at query time based on the current filter context. Unlike calculated columns, measures do not store values physically in the model; instead, they compute results dynamically in response to slicers, filters, drill-down actions, and visual interactions.

In this project, DAX measures were used to support five key analytical areas:

- Core business performance monitoring
- Customer and order-level aggregation
- Discount effectiveness analysis
- Profit leakage investigation
- Time intelligence and trend analysis

The measures were organized into logical groups to improve maintainability, readability, and report development efficiency.

---

### Measure Architecture

A dedicated measure table was implemented to centralize all analytical calculations within the semantic model.

This approach provides several advantages:

- Separation of calculations from physical data tables
- Improved model organization
- Simplified measure discovery and maintenance
- Consistent calculation governance
- Reduced model complexity for report consumers

The measure table serves as the single source of truth for business calculations used throughout the reporting solution.

---

### Core KPI Measures

These measures form the foundation of the report and represent the primary business metrics used throughout all report pages.

| **Measure**        | **Description**                                             |
| ------------------ | ----------------------------------------------------------- |
| Total Sales        | Total revenue generated from all transactions.              |
| Total Profit       | Net profit generated after accounting for gains and losses. |
| Total Quantity     | Total units sold across all orders.                         |
| Profit Margin %    | Profit expressed as a percentage of sales.                  |
| Average Discount % | Average discount applied across transactions.               |

**Business Purpose**

These measures serve as the primary performance indicators for evaluating overall business health. They are used extensively in KPI cards, category analysis, regional analysis, and trend reporting. Most advanced measures in the model are derived from these foundational KPIs.

---

### Count Measures

These measures provide entity-level counts and support customer, product, and order analysis.

| **Measure**        | **Description**                     |
| ------------------ | ----------------------------------- |
| Distinct Customers | Unique customers who placed orders. |
| Distinct Orders    | Unique orders processed.            |
| Distinct Products  | Unique products sold.               |

**Business Purpose**

Count measures provide context to revenue and profitability metrics. They help quantify business scale and customer reach while supporting executive summary reporting and performance benchmarking.

---

### Discount Analysis Measures

These measures evaluate the effectiveness and impact of discounting strategies.

| **Measure**            | **Description**                                |
| ---------------------- | ---------------------------------------------- |
| Discounted Sales       | Sales generated from discounted transactions.  |
| Discounted Profit      | Profit generated from discounted transactions. |
| Units Sold at Discount | Units sold with a non-zero discount.           |

**Business Purpose**

The objective of these measures is to determine whether discounts contribute positively to revenue growth or negatively impact profitability. These calculations support the Discount Effectiveness Analysis page and help identify subcategories where aggressive discounting may be reducing margins.

---

### Profit Leakage Measures

These measures were specifically developed to investigate profitability erosion and identify areas where losses occur.

| **Measure**                        | **Description**                                                       |
| ---------------------------------- | --------------------------------------------------------------------- |
| Total Loss                         | Total value of negative profits converted into positive loss amounts. |
| Total Sales Associated with Losses | Revenue generated from loss-making transactions.                      |
| Loss Making Transactions           | Number of transactions that resulted in a loss.                       |
| Loss Making Orders                 | Number of orders containing loss-making transactions.                 |
| Loss Making Products               | Number of products that generated losses.                             |
| Units Sold for Loss                | Units sold through loss-making transactions.                          |

**Business Purpose**

These measures form the analytical core of the project. Rather than focusing solely on profit generation, they quantify profit leakage by identifying where losses occur, how frequently they occur, and how much revenue is tied to unprofitable sales activity.

The Profit Leakage Analysis page uses these measures to identify loss-generating products, categories, discount buckets, and transactions.

---

### Dynamic Reporting Measures

These measures support interactive reporting features such as drill-through pages and dynamic report titles.

| **Measure**            | **Description**                                                              |
| ---------------------- | ---------------------------------------------------------------------------- |
| Selected Product Title | Dynamically displays the selected product in drill-through pages.            |
| Selected State         | Dynamically displays the selected state in visual titles and analysis pages. |
| States Served          | Number of states represented in the filtered dataset.                        |

**Business Purpose**

These measures improve report usability and enhance the user experience by creating context-aware titles, labels, and summaries that respond dynamically to user selections.

---

### Time Intelligence - Year-to-Date Measures

These measures evaluate cumulative business performance within the current year.

| **Measure**        | **Description**                                                        |
| ------------------ | ---------------------------------------------------------------------- |
| YTD Sales          | Cumulative sales from the beginning of the year to the selected date.  |
| YTD Profit         | Cumulative profit from the beginning of the year to the selected date. |
| YTD Loss           | Cumulative loss from the beginning of the year to the selected date.   |
| YTD Avg Discount % | Average discount calculated across the year-to-date period.            |

**Business Purpose**

YTD measures provide a cumulative view of business performance and allow management to evaluate progress throughout the year rather than relying solely on individual monthly results.

---

### Time Intelligence - Prior Year Measures

These measures calculate equivalent Year-to-Date metrics for the previous year.

| **Measure**                   | **Description**                                              |
| ----------------------------- | ------------------------------------------------------------ |
| Prior Year YTD Sales          | Previous year's cumulative sales for the equivalent period.  |
| Prior Year YTD Profit         | Previous year's cumulative profit for the equivalent period. |
| Prior Year YTD Loss           | Previous year's cumulative loss for the equivalent period.   |
| Prior Year YTD Avg Discount % | Previous year's average discount for the equivalent period.  |

**Business Purpose**

These measures establish a historical baseline for performance comparison and allow year-over-year benchmarking of revenue, profitability, losses, and discounting behavior.

---

### Time Intelligence - Year-over-Year Measures

These measures quantify performance changes relative to the previous year.

| **Measure**               | **Description**                                                   |
| ------------------------- | ----------------------------------------------------------------- |
| YoY Sales Growth %        | Percentage growth in sales compared to the prior year.            |
| YoY Profit Growth %       | Percentage growth in profit compared to the prior year.           |
| YoY Loss Growth %         | Percentage change in losses compared to the prior year.           |
| YoY Avg Discount Change % | Percentage change in average discount compared to the prior year. |

**Business Purpose**

These measures were used to determine whether business performance is improving or deteriorating over time. They support trend analysis and help answer critical business questions.

These measures form the foundation of the Profitability Trend Analysis page.

---

### Conclusion

The DAX measures documented in this phase establish the analytical calculation layer of the Power BI solution. Together, they transform raw transactional data into meaningful business metrics that support profitability analysis, discount evaluation, profit leakage investigation, and trend monitoring.

These measures provide the foundation for all report pages, interactive features, and time intelligence calculations implemented throughout the dashboard. With the calculation framework in place, the next phase focuses on report development, visualization design, interactive analytics, and communicating actionable business insights through an intuitive reporting experience.