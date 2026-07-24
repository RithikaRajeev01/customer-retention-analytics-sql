/*
======================================================================
File: 05_service_analysis.sql
Project: Customer Retention Analytics

Purpose:
Analyze customer churn across telecom services to identify which
service categories are associated with higher churn.

Analysis Performed:
• Churn by Internet Service
• Churn by Online Security
• Churn by Tech Support
• Churn by Phone Service
• Churn by Streaming TV

SQL Concepts Used:
• GROUP BY
• COUNT
• SUM
• CASE
• ROUND

======================================================================
*/

------------------------------------------------------------
-- 1. Churn by Internet Service
------------------------------------------------------------

SELECT InternetService,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY InternetService;


------------------------------------------------------------
-- 2. Churn by Online Security
------------------------------------------------------------
SELECT OnlineSecurity,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2
) AS churn_rate
FROM customers
GROUP BY OnlineSecurity;


------------------------------------------------------------
-- 3. Churn by Tech Support
------------------------------------------------------------
SELECT
TechSupport,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY TechSupport;


------------------------------------------------------------
-- 4. Churn by Phone Service
------------------------------------------------------------

SELECT PhoneService,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY PhoneService;


------------------------------------------------------------
-- 5. Churn by Streaming TV
------------------------------------------------------------
SELECT StreamingTV,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY StreamingTV;


------------------------------------------------------------
-- 6. Service Analysis Complete
------------------------------------------------------------

SELECT
'Service analysis completed successfully.'
AS Status;