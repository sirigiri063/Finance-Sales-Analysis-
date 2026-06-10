# Business Requirements Document (BRD)

**Project Name:** Sales & Financial Performance Analysis Dashboard
**Document Version:** 1.0
**Author:** Sirigiri Malakonda Reddy
**Date:** June 2025
**Status:** Approved

---

## 1. Executive Summary

This document outlines the business requirements for the Sales & Financial Performance Analysis Dashboard project. The objective is to analyze raw financial sales data across multiple countries, products, and customer segments and present the findings in an interactive Power BI dashboard that enables stakeholders to monitor performance, identify growth opportunities, and make data-driven decisions.

---

## 2. Business Background

The organization operates across multiple international markets and sells a range of products to different customer segments. Currently, sales and financial data is stored in raw spreadsheet form with no consolidated view of performance. Decision-makers lack visibility into:

- Which countries are most profitable
- Which products generate the highest margins
- How revenue is trending over time
- Which customer segments are underperforming

This project addresses these gaps by building a centralized, interactive analytics dashboard.

---

## 3. Business Objectives

| # | Objective | Priority |
|---|-----------|----------|
| 1 | Provide a single executive view of key financial KPIs | High |
| 2 | Identify top and bottom performing countries by profit | High |
| 3 | Evaluate profit margins across all products | High |
| 4 | Analyze customer segment performance | Medium |
| 5 | Track monthly and yearly revenue trends | Medium |
| 6 | Enable stakeholders to filter and explore data interactively | Medium |

---

## 4. Stakeholders

| Stakeholder | Role | Interest |
|-------------|------|----------|
| Sales Director | Primary user | Monitor country and product performance |
| Finance Manager | Primary user | Track profitability and margins |
| Marketing Team | Secondary user | Understand segment behavior |
| Executive Leadership | Reviewer | High-level KPI summary |
| Data Analyst | Builder | Develop and maintain the dashboard |

---

## 5. Scope

### In Scope
- Analysis of the provided financial sales dataset (`Finance_cleaned_dataset.csv`)
- Dashboard covering: KPIs, country performance, product margins, segment breakdown, and time trends
- Interactive filtering by Country, Product, Segment, and Date
- SQL-based data analysis
- Power BI dashboard development

### Out of Scope
- Real-time data integration or live database connections
- Predictive or forecasting models
- Data from sources outside the provided dataset
- Mobile-optimized dashboard layout

---

## 6. Functional Requirements

| ID | Requirement | Description |
|----|-------------|-------------|
| FR-01 | KPI Summary | Dashboard must display Total Sales, Total Profit, Units Sold, and Profit Margin % as headline cards |
| FR-02 | Country Analysis | Dashboard must rank countries by profit and show revenue share |
| FR-03 | Product Performance | Dashboard must display profit margin % for each product |
| FR-04 | Segment Breakdown | Dashboard must show revenue and profit by customer segment |
| FR-05 | Time Trend | Dashboard must show monthly revenue and profit trend as a line chart |
| FR-06 | Interactive Filters | Dashboard must include slicers for Country, Product, Segment, and Date Range |
| FR-07 | SQL Analysis | All key metrics must be verifiable via SQL queries |
| FR-08 | Data Documentation | Dataset fields must be documented in the README |

---

## 7. Non-Functional Requirements

| ID | Requirement | Description |
|----|-------------|-------------|
| NFR-01 | Performance | Dashboard must load within 10 seconds on a standard machine |
| NFR-02 | Usability | Dashboard must be understandable by a non-technical stakeholder |
| NFR-03 | Accuracy | All metrics must match the source dataset without rounding errors above 0.01% |
| NFR-04 | Maintainability | Data source path must be configurable so the dashboard can be refreshed with new data |
| NFR-05 | Portability | The `.pbix` file must be openable on any machine with Power BI Desktop installed |

---

## 8. Data Requirements

| Field | Type | Description |
|-------|------|-------------|
| Country | Text | Market where the sale occurred |
| Product | Text | Product name |
| Segment | Text | Customer segment (Government, Midmarket, Enterprise, etc.) |
| Units Sold | Numeric | Quantity sold per transaction |
| Sale Price | Numeric | Revenue per unit |
| Sales | Numeric | Total transaction revenue |
| Profit | Numeric | Profit from the transaction |
| Date | Date | Transaction date |

**Source:** `data/Finance_cleaned_dataset.csv`
**Cleaning performed:** Removed duplicates, handled nulls, standardized date format, validated numeric columns

---

## 9. Assumptions

- The dataset provided is complete and representative of the full business period
- Profit values in the dataset are net profit after cost of goods sold
- All currency values are in USD
- The dashboard is for internal use only and does not require authentication or role-based access

---

## 10. Constraints

- Tools limited to Microsoft Excel, Power Query, and Power BI Desktop (no paid BI tools)
- No live database connection — data is static and loaded from CSV/Excel
- Dashboard must be built as a single `.pbix` file

---

## 11. Acceptance Criteria

The project will be considered complete when:

- [ ] All FR-01 to FR-08 functional requirements are met in the dashboard
- [ ] SQL queries produce results consistent with the Power BI visuals
- [ ] README documents the project, dataset, and how to run the dashboard
- [ ] BRD, DAX measures, and findings documents are present in the `docs/` folder
- [ ] Dashboard screenshots are uploaded to the `assets/` folder

---

*Document prepared as part of the Finance Sales Analysis portfolio project.*
