## **Semantic Model Documentation**
#### Retail Profit Leakage and Discount Effectiveness Analysis


### Overview

Following the completion of the PostgreSQL data warehouse and SQL-based exploratory analysis, a semantic model was developed in Power BI to support interactive reporting, DAX calculations, and business intelligence workflows.

The semantic model provides an analytical layer between the physical warehouse and the reporting experience. It was designed using dimensional modeling principles to ensure consistent calculations, efficient filtering behavior, and scalable report development.

The model follows a star schema architecture and serves as the foundation for all dashboard pages, KPIs, and analytical measures developed during subsequent phases of the project.

### Data Source Architecture

Power BI connects directly to the PostgreSQL retail data warehouse using Import mode.

The following tables were imported into the model:

| **Table**     | **Type**  |
| ------------- | --------- |
| fact_sales    | Fact      |
| dim_customer  | Dimension |
| dim_order     | Dimension |
| dim_product   | Dimension |
| dim_geography | Dimension |
| dim_date      | Dimension |

The staging layer was intentionally excluded because it exists solely to support ETL processing and does not provide analytical value to report consumers.

Import mode was selected due to the relatively small dataset size and the need for optimal dashboard performance.

### Dimensional Model Design

The model is centered around the fact_sales table, which stores transactional business measures including sales, profit, quantity, and discount.

Supporting dimension tables provide descriptive attributes used for filtering, grouping, slicing, and drill-down analysis.

The semantic model follows a star schema design to:

- Simplify analytical reporting
- Improve query performance
- Support reusable DAX calculations
- Maintain clear separation between measures and descriptive attributes

### Relationship Configuration

Relationships were created between the fact table and each dimension table using keys established during warehouse development.

| **From**      | **To**     | **Cardinality** | **Filter Direction** |
| ------------- | ---------- | --------------- | -------------------- |
| dim_customer  | fact_sales | 1:\*            | Single               |
| dim_order     | fact_sales | 1:\*            | Single               |
| dim_product   | fact_sales | 1:\*            | Single               |
| dim_geography | fact_sales | 1:\*            | Single               |
| dim_date      | fact_sales | 1:\*            | Single               |

Single-direction filtering was adopted throughout the model to maintain predictable filter propagation and reduce ambiguity.

### Semantic Model

<img src="../Images/Semantic Model.png" width="1300">


**Date Intelligence Configuration**

The dim_date table was designated as the model's official date table.

During semantic model validation, Power BI identified that the initial date dimension contained only transaction dates and therefore did not qualify as a valid calendar table.

To address this limitation, the date dimension was redesigned and reloaded using a continuous calendar generated in PostgreSQL. The resulting table contains every date between the minimum order date and maximum ship date present in the dataset.

This implementation supports:

- Time intelligence calculations
- Consistent date filtering
- Custom date hierarchies
- Future trend and period-over-period analysis

The built-in Auto Date/Time feature was disabled in favor of the custom date dimension.

### Business Hierarchies

Several hierarchies were created to support drill-down analysis and improve report navigation.

**Product Hierarchy**

Category  
→ Sub-Category  
→ Product Name

**Geography Hierarchy**

Region  
→ State  
→ City

**Date Hierarchy**

Year  
→ Quarter  
→ Month Name

These hierarchies provide a structured navigation path that aligns with expected business reporting workflows.

### Model Optimization

Technical fields used primarily for relationships were hidden from report consumers to reduce clutter and improve usability.

Examples include:

- Sales ID
- Date Key
- Geography Key

Where appropriate, business users interact with descriptive attributes rather than surrogate keys or system-generated identifiers.

Geographic fields were categorized using Power BI data categories to improve location intelligence and mapping functionality.

Configured categories include:

- Country → Country/Region
- State → State or Province
- City → City
- Postal Code → Postal Code

The Region field was intentionally left uncategorized because it represents business reporting regions rather than geographic entities recognized by mapping services.

### Model Validation

Following model construction, aggregate measures were reconciled against previously validated SQL outputs to verify data integrity and relationship behavior.

Validation included:

- Total Sales
- Total Profit
- Total Quantity
- Average Discount
- Profit Margin

Successful reconciliation confirmed that the semantic model accurately represented the underlying warehouse data and was ready for analytical development.

### Conclusion

The completed semantic model provides a scalable analytical foundation for KPI development, DAX calculations, dashboard design, and business insight generation.

The next phase of the project focuses on measure development and the creation of interactive Power BI reports supporting profit leakage and discount effectiveness analysis.