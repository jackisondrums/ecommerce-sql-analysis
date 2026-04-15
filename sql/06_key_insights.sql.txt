-- ============================================
-- Key Insights
-- Purpose: Summarise the main findings from the analysis
-- ============================================



-- During validation, I identified that calculated transaction totals (price × quantity) did not match the provided purchase amounts. I therefore used the dataset’s total_purchase_amount field as the source of truth for revenue analysis.


-- Monthly revenue remained relatively stable between £14M and £16M, indicating consistent business performance over time.
-- Average order value remained stable (~£2,700), indicating that fluctuations in revenue were primarily driven by changes in transaction volume rather than customer spending per order.
-- The final data point has a significantly smaller total revenue, which is likely to represent incomplete data (i.e. month not yet ended).

-- There is approximately a 25% churn rate.
-- Churned customers spent roughly the same as active customers, suggesting that churn is not strongly correlated with customer spending levels. Other factors may be influencing retention.

-- The results show a high return rate. Home items especially have a total of 20147 items returned over 49851 transactions / approx. 40%.

-- Credit card is the most frequently used payment method
-- All payment methods show similar average order values