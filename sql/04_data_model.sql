-- ============================================
-- Data Modelling
-- Purpose: Transform the cleaned dataset into structured tables for analysis
-- ============================================



-- Creating a customer dimension table

CREATE TABLE customers AS SELECT DISTINCT
  customer_id,
  customer_name,
  age,
  gender,
  churn
FROM
  retail_clean;


  -- Checking customer data consistency
  
SELECT
  customer_id,
  COUNT(DISTINCT customer_name) AS name_count,
  COUNT(DISTINCT age) AS age_count,
  COUNT(DISTINCT gender) AS gender_count,
  COUNT(DISTINCT churn) AS churn_count
FROM
  retail_clean
GROUP BY
  customer_id
HAVING
  COUNT(DISTINCT customer_name) > 1
  OR COUNT(DISTINCT age) > 1
  OR COUNT(DISTINCT gender) > 1
  OR COUNT(DISTINCT churn) > 1;


-- Creating product dimension table
  
CREATE TABLE 
  products
SELECT DISTINCT 
  product_category, product_price
FROM
  retail_clean;

ALTER TABLE products
ADD COLUMN product_id INT AUTO_INCREMENT PRIMARY KEY;


-- Product count

SELECT COUNT(*) AS product_count
FROM products;


-- Creating fact table

CREATE TABLE fact_transactions AS
SELECT
  customer_id,
  purchase_date,
  product_category,
  product_price,
  quantity,
  total_purchase_amount,
  payment_method,
  returns 
FROM retail_clean;


-- Adding product-id

ALTER TABLE fact_transactions
ADD COLUMN product_id int;


-- Joining tables to assign product_id

UPDATE fact_transactions ft 
JOIN products
  ON ft.product_category = products.product_category
  AND ft. product_price = products.product_price
SET ft.product_id = products.product_id;