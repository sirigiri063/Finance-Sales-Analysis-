-- ============================================================
--  SALES & FINANCIAL PERFORMANCE ANALYSIS
--  SQL Queries for Business Intelligence Dashboard
--  Author: Sirigiri Malakonda Reddy
--  Table : finance_sales
-- ============================================================


-- ────────────────────────────────────────────────────────────
--  SECTION 1: SUMMARY KPIs
--  High-level business metrics for the executive KPI cards
-- ────────────────────────────────────────────────────────────

-- Total Revenue
SELECT SUM("Sales") AS total_revenue
FROM finance_sales;

-- Total Profit
SELECT SUM("Profit") AS total_profit
FROM finance_sales;

-- Total Units Sold
SELECT SUM("Units Sold") AS total_units_sold
FROM finance_sales;

-- Overall Profit Margin %
SELECT
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2) AS profit_margin_pct
FROM finance_sales;

-- All KPIs in one query
SELECT
    SUM("Sales")                                                AS total_revenue,
    SUM("Profit")                                               AS total_profit,
    SUM("Units Sold")                                           AS total_units_sold,
    COUNT(DISTINCT "Country")                                   AS total_countries,
    COUNT(DISTINCT "Product")                                   AS total_products,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2)    AS profit_margin_pct
FROM finance_sales;


-- ────────────────────────────────────────────────────────────
--  SECTION 2: COUNTRY-WISE ANALYSIS
--  Identifies top and bottom performing markets by profit
-- ────────────────────────────────────────────────────────────

-- Profit and Revenue by Country (ranked highest to lowest)
SELECT
    "Country",
    SUM("Sales")                                                AS total_revenue,
    SUM("Profit")                                               AS total_profit,
    SUM("Units Sold")                                           AS total_units,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2)    AS profit_margin_pct
FROM finance_sales
GROUP BY "Country"
ORDER BY total_profit DESC;

-- Top 3 Countries by Profit
SELECT
    "Country",
    SUM("Profit") AS total_profit
FROM finance_sales
GROUP BY "Country"
ORDER BY total_profit DESC
LIMIT 3;

-- Bottom 3 Countries by Profit (risk areas)
SELECT
    "Country",
    SUM("Profit") AS total_profit
FROM finance_sales
GROUP BY "Country"
ORDER BY total_profit ASC
LIMIT 3;

-- Country share of total revenue (%)
SELECT
    "Country",
    SUM("Sales") AS country_revenue,
    ROUND(
        SUM("Sales") * 100.0 / SUM(SUM("Sales")) OVER (), 2
    ) AS revenue_share_pct
FROM finance_sales
GROUP BY "Country"
ORDER BY country_revenue DESC;


-- ────────────────────────────────────────────────────────────
--  SECTION 3: PRODUCT PERFORMANCE
--  Evaluates profit margins and revenue across all products
-- ────────────────────────────────────────────────────────────

-- Revenue, Profit, and Margin by Product (ranked)
SELECT
    "Product",
    SUM("Sales")                                                AS total_revenue,
    SUM("Profit")                                               AS total_profit,
    SUM("Units Sold")                                           AS total_units,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2)    AS profit_margin_pct
FROM finance_sales
GROUP BY "Product"
ORDER BY profit_margin_pct DESC;

-- Best product by profit margin (Amarilla verification)
SELECT
    "Product",
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2) AS profit_margin_pct
FROM finance_sales
GROUP BY "Product"
ORDER BY profit_margin_pct DESC
LIMIT 1;

-- Products with below-average profit margin (underperformers)
SELECT
    "Product",
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2) AS profit_margin_pct
FROM finance_sales
GROUP BY "Product"
HAVING ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2)
    < (
        SELECT ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2)
        FROM finance_sales
    )
ORDER BY profit_margin_pct ASC;


-- ────────────────────────────────────────────────────────────
--  SECTION 4: SEGMENT ANALYSIS
--  Breaks down performance by customer/business segment
-- ────────────────────────────────────────────────────────────

-- Revenue and Profit by Segment
SELECT
    "Segment",
    SUM("Sales")                                                AS total_revenue,
    SUM("Profit")                                               AS total_profit,
    SUM("Units Sold")                                           AS total_units,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2)    AS profit_margin_pct
FROM finance_sales
GROUP BY "Segment"
ORDER BY total_revenue DESC;

-- Segment performance by Country (cross-analysis)
SELECT
    "Country",
    "Segment",
    SUM("Sales")   AS total_revenue,
    SUM("Profit")  AS total_profit
FROM finance_sales
GROUP BY "Country", "Segment"
ORDER BY "Country", total_revenue DESC;


-- ────────────────────────────────────────────────────────────
--  SECTION 5: TIME-BASED TREND ANALYSIS
--  Tracks monthly and yearly performance for trend reporting
-- ────────────────────────────────────────────────────────────

-- Monthly Revenue and Profit Trend
SELECT
    DATE_TRUNC('month', "Date"::DATE)                           AS month,
    SUM("Sales")                                                AS monthly_revenue,
    SUM("Profit")                                               AS monthly_profit,
    SUM("Units Sold")                                           AS monthly_units
FROM finance_sales
GROUP BY month
ORDER BY month ASC;

-- Year-over-Year Performance
SELECT
    EXTRACT(YEAR FROM "Date"::DATE)                             AS year,
    SUM("Sales")                                                AS annual_revenue,
    SUM("Profit")                                               AS annual_profit,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2)    AS annual_margin_pct
FROM finance_sales
GROUP BY year
ORDER BY year ASC;

-- Best performing month by revenue
SELECT
    DATE_TRUNC('month', "Date"::DATE)   AS month,
    SUM("Sales")                        AS monthly_revenue
FROM finance_sales
GROUP BY month
ORDER BY monthly_revenue DESC
LIMIT 1;
