/*
======================================================================
File: 06_customer_value_analysis.sql
Project: Customer Retention Analytics

Purpose:
Segment customers based on their lifetime value to identify
high-value customer groups.

Analysis Performed:
• Rank customers by TotalCharges
• Divide customers into value quartiles
• Analyze average revenue in each quartile

SQL Concepts Used:
• CTE
• NTILE()
• Window Functions
• GROUP BY
• AVG

======================================================================
*/

------------------------------------------------------------
-- Customer Value Quartiles
------------------------------------------------------------

WITH customer_value AS (

SELECT
    customerID,
    TotalCharges,

    NTILE(4) OVER(
        ORDER BY TotalCharges DESC
    ) AS value_quartile

FROM customers

WHERE TotalCharges IS NOT NULL

)

SELECT

value_quartile,

COUNT(*) AS customers,

ROUND(AVG(TotalCharges),2) AS avg_lifetime_value,

ROUND(MIN(TotalCharges),2) AS minimum_value,

ROUND(MAX(TotalCharges),2) AS maximum_value

FROM customer_value

GROUP BY value_quartile

ORDER BY value_quartile;


------------------------------------------------------------
-- Customer Value Analysis Complete
------------------------------------------------------------

SELECT
'Customer value analysis completed successfully.'
AS Status;