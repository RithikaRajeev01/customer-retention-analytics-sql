/*
======================================================================
File: 07_retention_priority.sql
Project: Customer Retention Analytics

Purpose:
Prioritize high-value customers who are at risk of churn so that
retention efforts can focus on customers with greater revenue impact.

Analysis Performed:
• Identify customers who have churned
• Rank churned customers by lifetime revenue
• Identify the highest-value customers lost to churn

SQL Concepts Used:
• CTE
• ROW_NUMBER()
• Window Functions
• ORDER BY
• WHERE

======================================================================
*/

------------------------------------------------------------
-- Retention Priority Ranking
------------------------------------------------------------

WITH retention_priority AS (

SELECT
    customerID,
    Contract,
    InternetService,
    MonthlyCharges,
    TotalCharges,

    ROW_NUMBER() OVER(
        ORDER BY TotalCharges DESC
    ) AS retention_priority

FROM customers

WHERE Churn = 'Yes'
AND TotalCharges IS NOT NULL

)

SELECT

retention_priority,
customerID,
Contract,
InternetService,
MonthlyCharges,
TotalCharges

FROM retention_priority

ORDER BY retention_priority;


------------------------------------------------------------
-- Retention Priority Analysis Complete
------------------------------------------------------------

SELECT
'Retention priority analysis completed successfully.'
AS Status;
