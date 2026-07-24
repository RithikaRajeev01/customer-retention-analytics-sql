/*
======================================================================
File: 08_customer_risk_score.sql
Project: Customer Retention Analytics

Purpose:
Assign a churn risk level to active customers based on business
rules identified during exploratory analysis.

Risk Factors:
• Month-to-month contract
• Fiber optic internet service
• No online security
• No tech support

SQL Concepts Used:
• CASE
• Logical Operators
• ORDER BY

======================================================================
*/

------------------------------------------------------------
-- Customer Risk Classification
------------------------------------------------------------

SELECT

customerID,

Contract,

InternetService,

OnlineSecurity,

TechSupport,

CASE

WHEN Contract='Month-to-month'
AND InternetService='Fiber optic'
AND OnlineSecurity='No'
AND TechSupport='No'

THEN 'High Risk'

WHEN Contract='Month-to-month'
AND (
InternetService='Fiber optic'
OR OnlineSecurity='No'
OR TechSupport='No'
)

THEN 'Medium Risk'

ELSE 'Low Risk'

END AS risk_level

FROM customers

WHERE Churn='No'

ORDER BY

CASE

WHEN Contract='Month-to-month'
AND InternetService='Fiber optic'
AND OnlineSecurity='No'
AND TechSupport='No'

THEN 1

WHEN Contract='Month-to-month'
AND (
InternetService='Fiber optic'
OR OnlineSecurity='No'
OR TechSupport='No'
)

THEN 2

ELSE 3

END;


------------------------------------------------------------
-- Risk Summary
------------------------------------------------------------

SELECT

CASE

WHEN Contract='Month-to-month'
AND InternetService='Fiber optic'
AND OnlineSecurity='No'
AND TechSupport='No'

THEN 'High Risk'

WHEN Contract='Month-to-month'
AND (
InternetService='Fiber optic'
OR OnlineSecurity='No'
OR TechSupport='No'
)

THEN 'Medium Risk'

ELSE 'Low Risk'

END AS risk_level,

COUNT(*) AS customers

FROM customers

WHERE Churn='No'

GROUP BY risk_level;


------------------------------------------------------------
-- Customer Risk Analysis Complete
------------------------------------------------------------

SELECT
'Customer risk analysis completed successfully.'
AS Status;