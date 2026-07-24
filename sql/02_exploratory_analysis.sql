/*
======================================================================
File: 02_exploratory_analysis.sql
Project: Customer Retention Analytics

Purpose:
Perform exploratory data analysis (EDA) to understand the customer
base before investigating churn patterns and business impact.

Analysis Performed:
• Total customers
• Customer churn distribution
• Overall churn rate
• Gender distribution
• Contract distribution
• Internet service distribution
• Payment method distribution

SQL Concepts Used:
• COUNT
• GROUP BY
• Aggregate Functions
• ROUND
• CASE

======================================================================
*/

------------------------------------------------------------
-- 1. Total Customers
------------------------------------------------------------

SELECT
COUNT(*) AS total_customers
FROM customers;


------------------------------------------------------------
-- 2. Customer Churn Distribution
------------------------------------------------------------

SELECT
Churn,
COUNT(*) AS customer_count
FROM customers
GROUP BY Churn;


------------------------------------------------------------
-- 3. Overall Churn Rate
------------------------------------------------------------

SELECT
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),
2
) AS churn_rate_percentage
FROM customers;


------------------------------------------------------------
-- 4. Gender Distribution
------------------------------------------------------------

SELECT
gender,
COUNT(*) AS customer_count
FROM customers
GROUP BY gender;


------------------------------------------------------------
-- 5. Contract Distribution
------------------------------------------------------------

SELECT
Contract,
COUNT(*) AS customer_count
FROM customers
GROUP BY Contract;


------------------------------------------------------------
-- 6. Internet Service Distribution
------------------------------------------------------------

SELECT
InternetService,
COUNT(*) AS customer_count
FROM customers
GROUP BY InternetService;


------------------------------------------------------------
-- 7. Payment Method Distribution
------------------------------------------------------------

SELECT
PaymentMethod,
COUNT(*) AS customer_count
FROM customers
GROUP BY PaymentMethod;


------------------------------------------------------------
-- 8. Exploratory Analysis Complete
------------------------------------------------------------

SELECT
'Exploratory data analysis completed successfully.'
AS Status;