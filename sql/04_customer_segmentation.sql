/*
======================================================================
File: 04_customer_segmentation.sql
Project: Customer Retention Analytics

Purpose:
Identify customer segments with the highest churn rates to support
targeted retention strategies.

Analysis Performed:
• Churn by Gender
• Churn by Senior Citizen Status
• Churn by Partner Status
• Churn by Dependents
• Churn by Contract Type

SQL Concepts Used:
• GROUP BY
• COUNT
• SUM
• CASE
• ROUND

======================================================================
*/

------------------------------------------------------------
-- 1. Churn by Gender
------------------------------------------------------------

SELECT gender,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY gender;


------------------------------------------------------------
-- 2. Churn by Senior Citizen
------------------------------------------------------------

SELECT SeniorCitizen,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY SeniorCitizen;


------------------------------------------------------------
-- 3. Churn by Partner Status
------------------------------------------------------------

SELECT Partner,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Partner;


------------------------------------------------------------
-- 4. Churn by Dependents
------------------------------------------------------------

SELECT Dependents,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Dependents;


------------------------------------------------------------
-- 5. Churn by Contract Type
------------------------------------------------------------

SELECT Contract,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Contract;


------------------------------------------------------------
-- 6. Customer Segmentation Complete
------------------------------------------------------------

SELECT
'Customer segmentation completed successfully.'
AS Status;