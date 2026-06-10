# DAX Measures Documentation

**Project:** Sales & Financial Performance Analysis Dashboard
**Author:** Sirigiri Malakonda Reddy
**Tool:** Power BI Desktop

---

## Overview

This document lists all DAX measures used in the Power BI dashboard (`reports/Sales_Financial_Analysis.pbix`), organized by category. Each measure includes the formula, purpose, and where it is used in the dashboard.

---

## 1. Core KPI Measures

These are the headline measures displayed on the executive KPI cards.

---

### Total Revenue
```dax
Total Revenue = SUM(finance_sales[Sales])
```
**Purpose:** Calculates the total sales revenue across all countries, products, and segments.
**Used in:** KPI card — Total Revenue

---

### Total Profit
```dax
Total Profit = SUM(finance_sales[Profit])
```
**Purpose:** Calculates the total profit across all transactions.
**Used in:** KPI card — Total Profit

---

### Total Units Sold
```dax
Total Units Sold = SUM(finance_sales[Units Sold])
```
**Purpose:** Counts the total number of units sold across all transactions.
**Used in:** KPI card — Units Sold

---

### Profit Margin %
```dax
Profit Margin % =
DIVIDE(
    SUM(finance_sales[Profit]),
    SUM(finance_sales[Sales]),
    0
) * 100
```
**Purpose:** Calculates the overall profit margin as a percentage of total revenue. Uses `DIVIDE` to safely handle division by zero.
**Used in:** KPI card — Profit Margin %, Product performance table

---

## 2. Country Analysis Measures

---

### Country Profit Rank
```dax
Country Profit Rank =
RANKX(
    ALL(finance_sales[Country]),
    [Total Profit],
    ,
    DESC,
    DENSE
)
```
**Purpose:** Ranks each country by total profit from highest to lowest. Used to highlight the top-performing market (France at $3.78M).
**Used in:** Country-wise profit bar chart

---

### Country Revenue Share %
```dax
Country Revenue Share % =
DIVIDE(
    [Total Revenue],
    CALCULATE([Total Revenue], ALL(finance_sales[Country])),
    0
) * 100
```
**Purpose:** Shows each country's contribution to total revenue as a percentage.
**Used in:** Country breakdown table

---

## 3. Product Analysis Measures

---

### Product Profit Margin %
```dax
Product Profit Margin % =
DIVIDE(
    SUM(finance_sales[Profit]),
    SUM(finance_sales[Sales]),
    0
) * 100
```
**Purpose:** Calculates profit margin at the product level. When used in a product visual, it filters automatically per product context.
**Used in:** Product performance table, margin comparison chart

---

### Best Product by Margin
```dax
Best Product by Margin =
CALCULATE(
    MAX(finance_sales[Product]),
    TOPN(
        1,
        VALUES(finance_sales[Product]),
        [Product Profit Margin %],
        DESC
    )
)
```
**Purpose:** Returns the name of the product with the highest profit margin. Confirms Amarilla at 15.86%.
**Used in:** Insight callout card

---

## 4. Time Intelligence Measures

---

### Monthly Revenue
```dax
Monthly Revenue =
CALCULATE(
    [Total Revenue],
    DATESMTD(finance_sales[Date])
)
```
**Purpose:** Calculates revenue for the current month-to-date period. Changes dynamically based on date slicer selection.
**Used in:** Monthly trend line chart

---

### Year-over-Year Revenue Growth %
```dax
YoY Revenue Growth % =
VAR CurrentYear = [Total Revenue]
VAR PreviousYear =
    CALCULATE(
        [Total Revenue],
        SAMEPERIODLASTYEAR(finance_sales[Date])
    )
RETURN
    DIVIDE(CurrentYear - PreviousYear, PreviousYear, 0) * 100
```
**Purpose:** Measures the percentage change in revenue compared to the same period in the previous year.
**Used in:** Revenue trend chart tooltip, YoY KPI card

---

### Previous Year Revenue
```dax
Previous Year Revenue =
CALCULATE(
    [Total Revenue],
    SAMEPERIODLASTYEAR(finance_sales[Date])
)
```
**Purpose:** Returns total revenue for the same period in the prior year, used as the baseline for YoY comparison.
**Used in:** YoY comparison visual

---

## 5. Segment Analysis Measures

---

### Segment Revenue Share %
```dax
Segment Revenue Share % =
DIVIDE(
    [Total Revenue],
    CALCULATE([Total Revenue], ALL(finance_sales[Segment])),
    0
) * 100
```
**Purpose:** Shows each segment's contribution to total revenue as a percentage.
**Used in:** Segment breakdown pie/bar chart

---

## DAX Best Practices Applied

| Practice | Description |
|----------|-------------|
| `DIVIDE()` instead of `/` | Prevents division by zero errors |
| `VAR` variables | Improves readability and performance in complex measures |
| `ALL()` for context removal | Ensures totals calculate across the full dataset, not just filtered context |
| `CALCULATE()` for context modification | Used to override filter context where needed |

---

*This document covers all measures used in version 1.0 of the dashboard.*
