-- ============================================
-- Business Analysis Queries
-- Purpose: Analyse revenue, customer behaviour, churn, returns, and payment methods
-- ============================================



-- Revenue by category

SELECT
  p.product_category,
  SUM(ft.total_purchase_amount) AS total_revenue,
  SUM(ft.quantity) AS total_units_sold,
  COUNT(*) AS transaction_count
FROM fact_transactions ft 
JOIN products p 
  ON ft.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC;


-- Top customers

SELECT
  c.customer_id, 
  c.customer_name,
  c.age,
  c.gender,
  SUM(ft.total_purchase_amount) AS total_spent,
  COUNT(*) AS total_orders,
  ROUND(SUM(ft.total_purchase_amount) / COUNT(*), 2) AS avg_order_value
FROM customers c 
JOIN fact_transactions ft 
  ON c.customer_id = ft.customer_id
GROUP BY 
  c.customer_id,
  c.customer_name,
  c.gender,
  c.age 
 ORDER BY total_spent DESC
 LIMIT 10;


-- Monthly trends

SELECT 
  DATE_FORMAT(ft.purchase_date, '%Y-%m') AS month,
  SUM(ft.total_purchase_amount) AS total_revenue,
  COUNT(*) AS transaction_count,
  ROUND(SUM(ft.total_purchase_amount) / COUNT(*), 2) AS avg_order_value
FROM fact_transactions ft 
GROUP BY DATE_FORMAT(ft.purchase_date, '%Y-%m')
ORDER BY month;


-- Churn analysis

SELECT
  c.churn,
  COUNT(DISTINCT c.customer_id) AS customer_count,
  SUM(ft.total_purchase_amount) AS total_revenue,
  ROUND(SUM(ft.total_purchase_amount) / COUNT(DISTINCT c.customer_id), 2) AS avg_revenue_per_customer
FROM fact_transactions ft
JOIN customers c
    ON ft.customer_id = c.customer_id
GROUP BY c.churn;


-- Item return rate

SELECT
  p.product_category,
  COUNT(*) AS total_transactions
FROM fact_transactions ft 
JOIN products p 
  ON ft.product_id = p.product_id
GROUP BY p.product_category;

SELECT 
  p.product_category,
  COUNT(*) AS returned_items
FROM fact_transactions ft 
JOIN products p 
  ON ft.product_id = p.product_id
WHERE ft.returns = 1
GROUP BY p.product_category;


-- Payment method by popularity

SELECT
  payment_method,
  COUNT(*) AS transaction_count,
  SUM(total_purchase_amount) AS total_revenue,
  ROUND(SUM(total_purchase_amount) / COUNT(*), 2) AS avg_order_value
 FROM fact_transactions
 GROUP BY payment_method
 ORDER BY total_revenue DESC;