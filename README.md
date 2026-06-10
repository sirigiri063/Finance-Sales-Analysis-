# 📊 Sales & Financial Performance Analysis Dashboard

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![Power Query](https://img.shields.io/badge/Power%20Query-217346?style=for-the-badge&logo=microsoft&logoColor=white)
![DAX](https://img.shields.io/badge/DAX-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=for-the-badge)

> A data analytics project leveraging Excel and Power BI to transform raw financial sales data into interactive dashboards, business insights, and performance reports — with country-wise and product-wise breakdowns.

---

## 📌 Table of Contents

- [Overview](#-overview)
- [Business Objectives](#-business-objectives)
- [Key Insights](#-key-insights)
- [Dashboard Preview](#-dashboard-preview)
- [Project Structure](#-project-structure)
- [Dataset Overview](#-dataset-overview)
- [Tools & Technologies](#-tools--technologies)
- [Dashboard Features](#-dashboard-features)
- [Project Workflow](#-project-workflow)
- [How to Run](#-how-to-run)
- [Author](#-author)

---

## 🧭 Overview

This project analyzes sales and financial performance data to help business stakeholders understand:
- Where revenue and profit are coming from
- Which products and countries are driving growth
- How performance compares across segments and time periods

The full workflow covers data cleaning in Excel, transformation with Power Query, DAX measure creation, and interactive dashboard development in Power BI.

---

## 🎯 Business Objectives

| # | Objective |
|---|-----------|
| 1 | Analyze overall sales and profit performance across markets |
| 2 | Identify the top-performing countries by profit contribution |
| 3 | Evaluate profit margins across different products |
| 4 | Track key business KPIs in a single executive view |
| 5 | Support data-driven decision-making with interactive reporting |

---

## 💡 Key Insights

| # | Insight |
|---|---------|
| 1 | 🇫🇷 **France** generated the highest profit at **$3.78M** — the top country by profitability |
| 2 | 🏆 **Amarilla** achieved the highest profit margin at **15.86%** — the most profitable product relative to sales |
| 3 | 📈 Revenue trends reveal clear seasonal patterns and high-performing time periods |
| 4 | 🗂️ Segment-level analysis shows significant variation in profitability across customer groups |
| 5 | 🌍 Country-wise performance varies considerably, highlighting expansion and risk areas |

---

## 📷 Dashboard Preview

> *Add screenshots of your Power BI dashboard to the `assets/` folder and they will display here.*

![Dashboard Preview](assets/dashboard_preview.png)

---

## 📁 Project Structure

```
Finance-Sales-Analysis/
│
├── 📂 data/
│   ├── Finance_cleaned_dataset.csv     # Cleaned source data (CSV)
│   └── Financial_working.xlsx          # Excel working file with analysis
│
├── 📂 reports/
│   └── Sales_Financial_Analysis.pbix   # Power BI dashboard file
│
├── 📂 docs/
│   └── STRUCTURE.md                    # Project structure reference
│
├── 📂 assets/
│   └── dashboard_preview.png           # Dashboard screenshot (add yours here)
│
└── README.md                           # You are here
```

---

## 📂 Dataset Overview

The dataset (`data/Finance_cleaned_dataset.csv`) contains financial sales records with the following fields:

| Column | Description |
|--------|-------------|
| `Country` | Market/country where the sale occurred |
| `Product` | Name of the product sold |
| `Segment` | Customer or business segment |
| `Units Sold` | Quantity of units sold per transaction |
| `Sale Price` | Revenue per unit |
| `Sales` | Total revenue from the transaction |
| `Profit` | Profit generated from the transaction |
| `Date` | Date of the transaction |

---

## 🛠 Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Microsoft Excel** | Data cleaning, preprocessing, and initial exploration |
| **Power Query** | Data transformation and column shaping |
| **Power BI Desktop** | Interactive dashboards and data visualization |
| **DAX** | Calculated measures for KPIs and custom metrics |

---

## 📊 Dashboard Features

The Power BI dashboard (`reports/Sales_Financial_Analysis.pbix`) includes:

- **Executive KPI Cards** — Total Sales, Total Profit, Units Sold, Profit Margin %
- **Country-wise Profit Analysis** — Ranked view of profit contribution by country
- **Product Performance Dashboard** — Profit margin comparison across all products
- **Sales Trend Visualization** — Time-series chart showing revenue over time
- **Segment Analysis** — Breakdown of sales and profit by business segment
- **Interactive Slicers** — Filter by Country, Product, Segment, and Time Period

---

## 🔄 Project Workflow

### 1️⃣ Data Preparation (Excel & Power Query)
- Cleaned raw financial data and handled missing values
- Standardized date formats and numeric columns
- Created derived columns for time-based analysis
- Shaped data using Power Query for dashboard compatibility

### 2️⃣ Dashboard Development (Power BI & DAX)
- Imported cleaned dataset into Power BI
- Built DAX measures for KPIs: Total Sales, Total Profit, Profit Margin %, Units Sold
- Designed the executive summary and drill-down dashboards
- Added interactive slicers for dynamic filtering across all visuals

---

## ▶️ How to Run

### Power BI Dashboard
1. Download `reports/Sales_Financial_Analysis.pbix`
2. Open with **Power BI Desktop** (free at [powerbi.microsoft.com](https://powerbi.microsoft.com))
3. If prompted, update the data source path to `data/Finance_cleaned_dataset.csv`
4. Click **Refresh** to reload the data

### Exploring the Data
1. Open `data/Financial_working.xlsx` in Microsoft Excel
2. The working file contains cleaned data and preliminary analysis sheets

---

## 👤 Author

**Sirigiri Malakonda Reddy**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin)](https://www.linkedin.com/in/sirigiri03/)
[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?style=flat&logo=github)](https://github.com/sirigiri063)

### Skills Demonstrated

`Data Cleaning` · `Data Analysis` · `Power Query` · `DAX` · `Power BI Dashboard Development` · `KPI Monitoring` · `Business Intelligence Reporting` · `Financial Analysis`

---

## 📄 License

This project uses publicly available financial sales data for educational and portfolio purposes.

---

*Built as a portfolio project to demonstrate end-to-end financial data analytics and business intelligence skills.*
