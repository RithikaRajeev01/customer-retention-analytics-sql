/*
======================================================================
File: 00_data_cleaning.sql
Project: Customer Retention Analytics

Purpose:
Perform initial data validation to ensure the customer dataset is
complete, consistent, and ready for churn and retention analysis.

Validation Performed:
• Verify total number of records
• Inspect table structure
• Preview sample data
• Detect duplicate customer IDs
• Check for missing values across all columns
• Identify invalid numeric values
• Validate TotalCharges before numeric conversion

SQL Concepts Used:
• Aggregate Functions
• GROUP BY & HAVING
• INFORMATION_SCHEMA
• Dynamic SQL (PREPARE / EXECUTE)

======================================================================
*/

------------------------------------------------------------
-- 1. Verify total number of records
------------------------------------------------------------

SELECT COUNT(*) AS total_records
FROM customers;


------------------------------------------------------------
-- 2. Inspect table structure
------------------------------------------------------------

DESCRIBE customers;


------------------------------------------------------------
-- 3. Preview dataset
------------------------------------------------------------

SELECT *
FROM customers
LIMIT 10;


------------------------------------------------------------
-- 4. Check for duplicate Customer IDs
------------------------------------------------------------

SELECT
    customerID,
    COUNT(*) AS occurrences
FROM customers
GROUP BY customerID
HAVING COUNT(*) > 1;


------------------------------------------------------------
-- 5. Check NULL values for every column (Dynamic SQL)
------------------------------------------------------------

SELECT
GROUP_CONCAT(
    CONCAT(
        'SUM(`',
        COLUMN_NAME,
        '` IS NULL) AS `',
        COLUMN_NAME,
        '_nulls`'
    )
    ORDER BY ORDINAL_POSITION
    SEPARATOR ', '
)
INTO @null_sql
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
AND TABLE_NAME = 'customers';


SET @null_sql = CONCAT(
    'SELECT ',
    @null_sql,
    ' FROM customers;'
);


PREPARE stmt FROM @null_sql;

EXECUTE stmt;

DEALLOCATE PREPARE stmt;


------------------------------------------------------------
-- 6. Check for invalid numeric values
------------------------------------------------------------

SELECT *
FROM customers
WHERE
      tenure < 0
   OR MonthlyCharges < 0
   OR TotalCharges < 0;


------------------------------------------------------------
-- 7. Validate TotalCharges before Numeric Conversion
------------------------------------------------------------

/*
Business Reason:
The TotalCharges column is currently stored as TEXT after importing
the dataset. Before converting it to a numeric data type, verify that
it does not contain blank values or invalid entries that could cause
the conversion to fail.

Observation:
Customers with tenure = 0 may have blank TotalCharges because they
have not yet completed a billing cycle.
*/

SELECT *
FROM customers
WHERE TRIM(TotalCharges) = '';


------------------------------------------------------------
-- 8. Final validation
------------------------------------------------------------

SELECT
'Dataset validation completed successfully.'
AS Status;