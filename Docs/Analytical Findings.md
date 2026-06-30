## **Analytical Findings**
#### **Retail Profit Leakage & Discount Effectiveness Analysis**

### Introduction

The purpose of this analysis was to investigate profit leakage within the retail business and identify the factors impacting profitability across products, categories, regions, and time periods. Although the company generated \$2.33M in sales and remained profitable overall, the presence of significant loss exposure indicated that profitability was not being generated consistently throughout the business.

Using a combination of SQL analysis and an interactive Power BI dashboard, the investigation progressed from high-level business performance to detailed root-cause analysis. The findings presented in this document follow the same analytical journey as the dashboard, examining overall performance, loss-generating products, discount effectiveness, regional trends, and historical performance patterns to understand where profit leakage occurs and what business factors contribute to it.

### Scope and Methodology

This document presents the detailed analytical findings derived from exploratory SQL analysis and Power BI investigation of the Superstore retail dataset (10,194 order lines, January 2023 - December 2026, United States and Canada). Findings are organized to mirror the structure of the Power BI dashboard - Executive Overview, Profit Leakage Analysis, Discount Effectiveness Analysis, Regional Performance Analysis, and Time Intelligence Trend Analysis - so each section can be read alongside its corresponding dashboard page. All figures have been reconciled against the published dashboard and the underlying PostgreSQL data warehouse.

### Page 1 - Executive Overview Findings

The analysis began with the Executive Overview page to establish a baseline understanding of overall business performance.

At first glance, the business appeared healthy, generating **\$2.33M in sales** and **\$292.30K in profit**, resulting in a **12.56% profit margin**. However, the KPI cards also revealed **\$157.04K in total losses**, indicating that profitability was not distributed evenly across the business.

Category-level analysis quickly identified **Furniture** as a potential area of concern. Despite generating **\$754.7K in sales**, comparable to both Technology and Office Supplies, Furniture produced only **\$19.7K in profit** and a margin of just **2.61%**. In contrast, Technology and Office Supplies both generated margins above **17%**, suggesting that a significant portion of profit leakage was concentrated within Furniture.

Regional analysis revealed a similar imbalance. The **West region** generated the highest profit (**\$110.8K**) while the **Central region** generated only **\$39.9K** despite producing over **\$503K in sales**, indicating that regional factors may also be impacting profitability.

The quarterly sales and profit trend further showed that revenue growth was not always translating into proportional profit growth, reinforcing the need for deeper investigation.

Overall, the Executive Overview established the key theme for the remainder of the analysis: **while the business was profitable overall, certain categories, products, and regions were generating disproportionate losses that were reducing overall profitability.**

### Page 2 - Profit Leakage Analysis Findings

After identifying unusually weak profitability in Furniture and signs of uneven performance across the business, the analysis shifted to understanding where losses were occurring and how concentrated they were.

The KPI section revealed that the business generated **\$157.04K in total losses**, associated with **1,901 loss-making transactions**, **1,344 loss-making orders**, and **768 products**. These figures indicated that profit leakage was not caused by a handful of isolated incidents but was a recurring issue affecting a significant portion of operations.

The Category → Subcategory drill-down analysis revealed that losses were highly concentrated rather than evenly distributed. Four subcategories emerged as the primary drivers of profit leakage:

- **Binders:** \$38.56K loss
- **Tables:** \$32.50K loss
- **Machines:** \$30.12K loss
- **Bookcases:** \$12.35K loss

Together, these subcategories accounted for approximately **72.3% of total losses**, despite representing only a small portion of the overall product catalog.

The Top 15 Loss Making Products table reinforced this finding by showing that a relatively small number of products contributed disproportionately to loss exposure. Several products from the Machines, Tables, and Bookcases subcategories repeatedly appeared among the largest loss contributors, suggesting that **losses were concentrated around specific products rather than entire categories.**

The drill-through functionality provided additional validation. Product-level analysis showed that many loss-generating products were not consistently unprofitable across all transactions. Instead, **losses were often concentrated within specific orders, regions, and discount levels, indicating that transaction-level decisions were playing an important role in profitability outcomes.**

The Total Loss by Discount Bucket visual provided the most significant insight on this page. Using the Discount Bucket → Actual Discount drill-down, the analysis showed that **transactions discounted above 30% generated approximately \$128K in losses**, representing **81.66% of all losses in the business**. This immediately shifted the investigation from identifying where losses occurred to understanding why heavily discounted transactions were producing such disproportionate negative results.

Overall, the Profit Leakage Analysis established that **profit leakage was highly concentrated within a small number of products, subcategories, and discount levels,** providing a clear direction for the next stage of the investigation.

### Page 3 - Discount Effectiveness Analysis Findings

The Profit Leakage Analysis page established that more than 80% of all losses originated from transactions receiving discounts above 30%. The next step was determining whether discounting itself was the primary driver of profit leakage and understanding how profitability changed across different discount levels.

The relationship between discounts and profitability was immediately visible in the Profit Margin by Discount Bucket visual. Transactions sold without discounts generated a healthy **29.56% profit margin**, while margins steadily declined as discount levels increased. Profitability turned negative in the **20%-30% discount bucket (-10.06%)** and deteriorated sharply in the **30%+ bucket (-48.22%)**, indicating that heavily discounted transactions were consistently destroying value.

The Sales and Profit by Discount Bucket visual reinforced this pattern. While the **30%+ discount bucket accounted for only \$260.3K in sales (11.2% of total revenue)**, it generated **\-\$125.5K in profit** and was responsible for **81.66% of all losses** across the business. This finding confirmed that **profit leakage was not broadly distributed across all discount levels but was overwhelmingly concentrated in the highest discount tier.**

The Average Discount by Subcategory visual helped connect these findings back to the products identified on the previous page. Subcategories such as **Binders (36.91%)**, **Machines (30.43%)**, **Tables (25.81%)**, and **Bookcases (21.53%)** received some of the highest average discounts in the business. These **same subcategories had already been identified as the largest contributors to profit leakage**, suggesting a direct relationship between aggressive discounting and poor financial performance.

The custom tooltip implemented on this page provided additional context while exploring subcategories, allowing profitability and discount metrics to be viewed simultaneously without navigating away from the visual. This made it easier to identify cases where seemingly healthy subcategories contained highly unprofitable discount segments beneath the surface.

Further analysis showed that discounted transactions generated **\$1.22M in sales but a net loss of \$34.4K (-2.82% margin)**, whereas non-discounted transactions generated **\$326.7K in profit at a margin of 29.56%**. In addition, the relationship between discount depth and order quantity was effectively zero (**correlation = +0.007**), indicating that larger discounts were not associated with larger order sizes. This challenges the assumption that aggressive discounting was successfully driving additional demand.

Overall, the Discount Effectiveness Analysis demonstrated that **discounting was the single strongest driver of profit leakage. The issue was not the presence of discounts themselves, but the concentration of deep discounts on already vulnerable products and subcategories, resulting in substantial margin erosion and persistent losses.**

### Page 4 - Regional Performance Analysis Findings

Having established that aggressive discounting was a major contributor to profit leakage, the next step was determining whether losses were concentrated geographically or distributed evenly across the business.

The regional scatter plot comparing **Average Discount %** and **Profit Margin %** revealed a clear inverse relationship between discounting and profitability. The **West region** generated the highest margin (**14.98%**) while maintaining the lowest average discount (**10.89%**). In contrast, the **Central region** carried the highest average discount (**24.10%**) and the lowest margin (**7.92%**), making it the weakest-performing region in the business.

This pattern suggested that the discounting behavior identified on the previous page was not occurring uniformly across all markets. Certain regions appeared to be relying much more heavily on discounting, with corresponding reductions in profitability.

The Azure Maps visual allowed the analysis to move from the regional level to the state level. The map immediately highlighted a small group of states responsible for a disproportionate share of loss exposure. The largest contributors were:

- **Texas:** \$36.81K loss
- **Ohio:** \$21.75K loss
- **Pennsylvania:** \$21.60K loss
- **Illinois:** \$19.50K loss
- **North Carolina:** \$11.56K loss

Together, these five states accounted for approximately **70.8% of total losses** recorded in the dataset.

The custom map tooltip provided additional context while exploring individual states, exposing profit, discount, and sales metrics without requiring users to leave the visual. This helped identify states where strong revenue performance was being offset by poor profitability.

Further investigation revealed that **Texas** represented the most significant geographic risk in the business. Despite generating more than **\$170K in sales**, the state recorded a **negative profit margin of -15.12%** and an average discount of approximately **37%**, more than double the company-wide average. The losses were primarily concentrated within Furniture and Office Supplies, both of which showed unusually aggressive discounting behavior.

The Regional Analysis page also highlighted an important interaction between geography and category performance. While Furniture was the weakest category overall, it was not equally problematic in every region. The combination of **Central Region + Furniture** emerged as the only region-category combination producing an overall net loss, demonstrating that regional pricing and discounting practices were amplifying the category-level profitability issues identified earlier in the analysis.

Overall, the Regional Performance Analysis demonstrated that profit leakage was not only a product and discounting problem but also a geographic one. A relatively small number of states and regions were responsible for a disproportionate share of losses, suggesting that profitability challenges were concentrated within specific markets rather than across the entire business.

### Page 5 - Time Intelligence Trend Analysis Findings

The previous pages identified where profit leakage was occurring and the factors contributing to it. The final step was determining whether the problem was improving, remaining stable, or becoming more severe over time.

The year-over-year trend analysis showed that the business experienced strong growth throughout the analysis period. Total sales increased from **\$494.0K in 2023** to **\$745.6K in 2026**, while total profit increased from **\$51.7K** to **\$95.9K**. On the surface, these figures suggested a business moving in the right direction.

However, a closer examination of loss trends revealed a more concerning story.

Total gross loss increased from **\$32.2K in 2023** to **\$54.2K in 2026**, representing a **68.4% increase** over the four-year period. While losses remained relatively stable between 2023 and 2024, growth accelerated significantly in later years, particularly in 2026.

The YoY Growth visual highlighted this shift clearly. In 2026, **loss growth (+42.4%) outpaced both sales growth (+21.5%) and profit growth (+15.9%)**. This was the first year in the dataset where losses were increasing faster than the core performance metrics of the business, indicating that profit leakage was becoming a larger problem rather than being corrected through growth.

The YTD Loss versus Prior Year YTD Loss visual reinforced this finding. Across the analysis period, current-year losses consistently exceeded prior-year performance, showing that loss exposure was increasing alongside business expansion.

The dedicated **30%+ Discount Bucket Trend** visual provided the most important insight on this page. Previous analysis established that high-discount transactions generated the majority of losses. The trend analysis showed that this relationship remained remarkably consistent over time. Transactions receiving discounts above 30% accounted for approximately **81%-83% of all losses every year** from 2023 through 2026.

This finding is particularly significant because it demonstrates that the business was not experiencing a new or isolated problem. The same discounting behavior identified earlier in the analysis had been driving losses for multiple years, and the financial impact of that behavior was growing as the business expanded.

The Profit Margin Trend visual provided further evidence. Profit margins improved between 2023 and 2025, reaching a peak of **13.46% in 2025**, before declining to **12.87% in 2026**. This marked the first year-over-year margin contraction in the dataset and coincided with the sharp increase in loss growth observed during the same period.

Overall, the Time Intelligence Analysis demonstrated that profit leakage is not a historical issue that has already been addressed. Instead, it is a structural and recurring problem that has persisted throughout the analysis period. While sales and profits continue to grow, losses are growing at an even faster rate, largely driven by the same high-discount transactions identified throughout the rest of the investigation.

### Root Cause Summary

The analysis began with a seemingly healthy business generating **\$2.33M in sales** and **\$292.30K in profit**. However, the Executive Overview revealed the existence of **\$157.04K in gross losses**, indicating that profitability was not being generated consistently across the organization.

The investigation first focused on category performance and quickly identified **Furniture** as a major area of concern. Despite generating sales comparable to Technology and Office Supplies, Furniture produced only **\$19.7K in profit** and a margin of **2.61%**, significantly below the margins achieved by the other major categories.

Rather than being distributed across the entire catalog, losses were found to be heavily concentrated within a small group of subcategories, particularly **Binders (\$38.56K loss)**, **Tables (\$32.50K loss)**, **Machines (\$30.12K loss)**, and **Bookcases (\$12.35K loss)**. Together, these four subcategories accounted for approximately **72.3% of total losses**, demonstrating that profit leakage was concentrated rather than widespread.

A clear and consistent relationship between discount depth and profitability was revealed when transactions receiving discounts above **30%** generated a margin of **\-48.22%** and accounted for approximately **81.66% of all losses**, despite representing only **11.2% of total sales**. At the same time, deeper discounts showed virtually no relationship with order quantity, indicating that aggressive discounting was not meaningfully increasing sales volume.

The weakest-performing regions were also those applying the highest average discounts. The **Central region** generated the lowest profit margin while maintaining the highest average discount level, and states such as **Texas, Ohio, Pennsylvania, and Illinois** emerged as the largest contributors to loss exposure. Together, these states accounted for approximately **70.8% of total losses**, demonstrating that profit leakage was geographically concentrated as well as product concentrated.

In many cases, products remained profitable overall but generated substantial gross loss exposure through a subset of heavily discounted orders.

Finally, the Time Intelligence analysis demonstrated that these issues were not isolated incidents or recent anomalies. The same discount-driven loss patterns persisted throughout the entire four-year period. Transactions receiving discounts above 30% accounted for approximately **81%-83% of total losses every year**, while total losses increased from **\$32.2K in 2023** to **\$54.2K in 2026**. Most concerning, **2026 was the first year in which loss growth outpaced both sales growth and profit growth**, indicating that profit leakage is becoming more severe as the business expands.

Taken together, the findings consistently point toward four interconnected root causes:

- Profit leakage is concentrated within a small number of products and subcategories rather than being spread evenly across the catalog.
- Aggressive discounting, particularly discounts above 30%, is the primary driver of margin erosion and loss generation.
- Geographic markets do not perform uniformly, with a small number of regions and states contributing a disproportionate share of total losses.
- The problem is structural rather than temporary, as the same patterns have persisted across multiple years and continue to grow alongside the business.

The evidence suggests that profit leakage is not the result of weak demand or insufficient sales performance. Instead, it is driven by the interaction of product mix, discounting practices, and regional performance differences that collectively reduce the profitability of an otherwise successful business.