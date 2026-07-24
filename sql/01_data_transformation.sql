use telco_db;
/*
======================================================================
File: 01_data_transformation.sql
Project: Customer Retention Analytics

Purpose:
Transform the validated dataset into an analysis-ready format by
correcting data types and handling missing values identified during
the validation stage.

Transformations Performed:
• Replace blank TotalCharges values with NULL
• Convert TotalCharges from TEXT to DOUBLE
• Verify successful transformation

SQL Concepts Used:
• UPDATE
• ALTER TABLE
• Data Type Conversion
• Data Validation

======================================================================
*/

------------------------------------------------------------
-- 1. Replace Blank TotalCharges with NULL
------------------------------------------------------------

/*
Business Reason:
Customers with tenure = 0 have not yet completed a billing cycle.
Their TotalCharges values are stored as blank strings. These blanks
must be converted to NULL before changing the column to a numeric
data type.
*/

UPDATE customers
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '';


------------------------------------------------------------
-- 2. Verify Blank Values Removed
------------------------------------------------------------

SELECT *
FROM customers
WHERE TRIM(CAST(TotalCharges AS CHAR)) = '';


------------------------------------------------------------
-- 3. Convert TotalCharges to DOUBLE
------------------------------------------------------------

/*
Business Reason:
Revenue, customer lifetime value, and other financial analyses
require TotalCharges to be stored as a numeric data type.
*/

ALTER TABLE customers
MODIFY COLUMN TotalCharges DOUBLE;


------------------------------------------------------------
-- 4. Verify Updated Table Structure
------------------------------------------------------------
DESCRIBE customers;


------------------------------------------------------------
-- 5. Verify Converted NULL Values
------------------------------------------------------------

SELECT *
FROM customers
WHERE TotalCharges IS NULL;


------------------------------------------------------------
-- 6. Transformation Summary
------------------------------------------------------------

SELECT
'Data transformation completed successfully.'
AS Status;