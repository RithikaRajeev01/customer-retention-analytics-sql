use telco_db;
/*
======================================================================
File: 03_revenue_impact.sql
Project: Customer Retention Analytics

Purpose:
Measure the financial impact of customer churn by analyzing
monthly and lifetime revenue across churned and retained customers.

Analysis Performed:
• Total monthly revenue
• Total lifetime revenue
• Revenue by churn status
• Average monthly revenue by churn status
• Average lifetime revenue by churn status

SQL Concepts Used:
• SUM
• AVG
• ROUND
• GROUP BY
• Aggregate Functions

======================================================================
*/

------------------------------------------------------------
-- 1. Total Monthly Revenue
------------------------------------------------------------

SELECT
ROUND(SUM(MonthlyCharges),2) AS total_monthly_revenue
FROM customers;


------------------------------------------------------------
-- 2. Total Lifetime Revenue
------------------------------------------------------------

SELECT
ROUND(SUM(TotalCharges),2) AS total_lifetime_revenue
FROM customers;


------------------------------------------------------------
-- 3. Monthly Revenue by Churn Status
------------------------------------------------------------

SELECT
Churn,
ROUND(SUM(MonthlyCharges),2) AS monthly_revenue
FROM customers
GROUP BY Churn;


------------------------------------------------------------
-- 4. Lifetime Revenue by Churn Status
------------------------------------------------------------
SELECT
Churn,
ROUND(SUM(TotalCharges),2) AS lifetime_revenue
FROM customers
GROUP BY Churn;

------------------------------------------------------------
-- 5. Average Monthly Revenue per Customer
------------------------------------------------------------

SELECT Churn,
ROUND(AVG(MonthlyCharges),2) AS avg_monthly_revenue
FROM customers
GROUP BY Churn;


------------------------------------------------------------
-- 6. Average Lifetime Revenue per Customer
------------------------------------------------------------

SELECT
Churn,
ROUND(AVG(TotalCharges),2) AS avg_lifetime_revenue
FROM customers
GROUP BY Churn;


------------------------------------------------------------
-- 7. Revenue Impact Analysis Complete
------------------------------------------------------------

SELECT
'Revenue impact analysis completed successfully.'
AS Status;