## **SQL Analysis Summary**
#### **Retail Profit Analysis and Discount Effectiveness Analysis**
---

### Overview

Following the successful construction and validation of the retail data warehouse, an exploratory SQL analysis was conducted to investigate profitability patterns, discount behavior, product performance, and regional trends.

The objective of this analysis was not only to measure business performance but also to identify potential sources of profit leakage that could be investigated further through interactive Power BI reporting.

The analysis focused on three primary questions:

- Where is profitability being lost?
- What role do discounts play in reducing profitability?
- Are losses concentrated within specific products, categories, or regions?

---

### Executive Performance Overview

The business generated approximately \$2.33 million in sales and \$292 thousand in profit, resulting in an overall profit margin of 12.56%.

While overall profitability remains positive, the margin is considerably lower than what would typically be expected from several of the higher-performing product categories. This suggested that certain areas of the business may be significantly underperforming and offsetting gains generated elsewhere.

This observation became the starting point for deeper profitability analysis.

---

### Category-Level Profitability Analysis

Category-level analysis revealed a significant disparity in profitability across major product groups.

Although Furniture generated sales volumes comparable to Technology and Office Supplies, its profitability was substantially lower. Furniture produced a profit margin of only 2.61%, compared with margins exceeding 17% for both Technology and Office Supplies.

This finding indicates that sales volume alone is not a reliable indicator of business performance. Certain product categories appear capable of generating substantial revenue while contributing little to overall profitability.

The combination of relatively high sales, low profit, and elevated discount levels suggests that Furniture may represent a significant source of profit leakage within the business.

---

### Discount Effectiveness Analysis

One of the primary objectives of this project was to evaluate whether discounting practices were negatively impacting profitability.

To investigate this relationship, transactions were grouped into discount ranges and compared against resulting profit margins.

The analysis revealed a clear downward trend in profitability as discount levels increased.

Orders receiving no discount generated the strongest margins, while transactions receiving discounts above 20% exhibited negative profitability. The highest discount group (30%+) produced the largest losses and the lowest margins observed during the analysis.

These results suggest that discounting is not merely reducing profitability but may be actively contributing to profit leakage when applied beyond certain thresholds.

At this stage, the analysis supports the hypothesis that aggressive discounting is a major factor influencing profitability performance.

---

### Sub-Category and Product Performance

To identify the underlying drivers of category-level losses, the analysis was extended to the sub-category and product level.

Several sub-categories emerged as persistent underperformers, particularly within Furniture. Tables and Bookcases generated negative profits despite meaningful sales volume, indicating that losses are concentrated within specific product groups rather than distributed evenly across the category.

A product-level investigation reinforced this pattern. A relatively small number of products accounted for a disproportionate share of overall losses. Many of these products shared two common characteristics:

- High average discount rates
- High transaction values

This concentration of losses suggests that profit leakage may be driven by a limited number of products rather than broad operational inefficiencies across the entire product portfolio.

Further analysis will be required to determine whether pricing strategy, discount policy, product cost structure, or regional factors are responsible for these losses.

---

### Regional Performance Analysis

Regional analysis identified meaningful differences in profitability performance across geographic markets.

The Central region exhibited the highest average discount levels and the lowest profit margin among all regions analyzed. In contrast, the West region generated both the highest profits and the strongest margins while maintaining substantially lower discount levels.

This pattern is consistent with observations identified during the discount analysis and introduces a new hypothesis:

Regional discounting practices may be influencing profitability outcomes.

This relationship will be explored further during dashboard development and interactive analysis.

---

### Preliminary Hypotheses

Based on the SQL analysis, several hypotheses have emerged:

**Hypothesis 1** : Aggressive discounting is a primary contributor to profit leakage.

**Hypothesis 2**: Profit leakage is concentrated within a relatively small number of products and sub-categories rather than across the entire business.

**Hypothesis 3**: Furniture-related products, particularly Tables and Bookcases, contribute disproportionately to profitability challenges.

**Hypothesis 4**: Regional pricing and discounting behavior may influence profitability performance.

These hypotheses will be validated and refined during the Power BI analysis phase.

---

### Next Steps

The findings documented in this report represent preliminary observations derived from SQL-based exploratory analysis.

The next phase of the project will focus on Power BI dashboard development, where interactive visualizations, DAX measures, and dimensional analysis will be used to validate findings, explore relationships between business dimensions, and develop final recommendations.

The final Business Insights Report will incorporate findings from both SQL analysis and Power BI investigation before presenting conclusions and recommendations.