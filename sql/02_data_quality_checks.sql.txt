-- ============================================
-- Data Quality Checks
-- Purpose: Identify null values, duplicates, and inconsistencies in the dataset
-- ============================================



-- Checking for nulls accross columns
  
SELECT
    COUNT(*) AS total_rows,
    SUM(customer_id IS NULL) AS null_customer_id,
    SUM(purchase_date IS NULL) AS null_purchase_date,
    SUM(product_category IS NULL) AS null_product_category,
    SUM(product_price IS NULL) AS null_product_price,
    SUM(quantity IS NULL) AS null_quantity,
    SUM(total_purchase_amount IS NULL) AS null_total_amount,
    SUM(payment_method IS NULL) AS null_payment_method,
    SUM(customer_name IS NULL) AS null_customer_name,
    SUM(age IS NULL) AS null_age,
    SUM(gender IS NULL) AS null_gender,
    SUM(returns IS NULL) AS null_returns,
    SUM(churn IS NULL) AS null_churn
FROM 
  ecommerce_customer_data;

-- Checking for duplicates

SELECT
    customer_id,
    purchase_date,
    product_category,
    product_price,
    quantity,
    total_purchase_amount,
    payment_method,
    returns,
    COUNT(*) AS duplicate_count
FROM retail_clean
GROUP BY
    customer_id,
    purchase_date,
    product_category,
    product_price,
    quantity,
    total_purchase_amount,
    payment_method,
    returns
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;