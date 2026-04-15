-- ============================================
-- Data Cleaning and Validation
-- Purpose: Prepare the dataset by creating a clean working table and resolving data issues
-- ============================================



-- Creating a clean working table

CREATE TABLE retail_clean AS
SELECT *
FROM raw_data;


-- Creating calculated total for validation

ALTER TABLE retail_clean
ADD COLUMN calculated_total INT;

UPDATE retail_clean
SET calculated_total = product_price * quantity;


-- Checking duplicate age columns

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN customer_age = age THEN 1 ELSE 0 END) AS matching_ages,
    SUM(CASE WHEN customer_age <> age THEN 1 ELSE 0 END) AS different_ages
FROM retail_clean;


-- Dropping duplicate column

ALTER TABLE retail_clean
DROP COLUMN customer_age;