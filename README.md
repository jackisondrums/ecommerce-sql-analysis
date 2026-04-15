# Ecommerce SQL Data Cleaning and Analysis

## Project Overview
This project explores an ecommerce transaction dataset using SQL. The goal was to inspect raw data, validate data quality, clean and prepare the dataset, build a structured data model, and generate business insights related to revenue, customer behaviour, churn, returns, and payment methods.

## Objectives
- Inspect the dataset structure
- Identify null values and duplicate records
- Clean and validate the dataset
- Build a simple relational data model
- Perform business analysis using SQL
- Summarise key insights

## Tools Used
- MySQL
- GitHub

## Dataset Summary
The dataset contains:
- 250,000 transactions
- 49,673 unique customers

This indicates repeat purchasing behaviour and allows for customer-level analysis.

## Data Cleaning and Preparation
The following steps were carried out:
- Inspected schema and previewed raw data
- Checked for null values across all key columns
- Created a clean working table to preserve raw data
- Validated transaction totals using a calculated field
- Identified duplicate columns (`age` and `customer_age`)
- Removed redundant fields
- Checked for duplicate transactions

## Data Model
A simple relational structure was created:

- `customers` – one row per customer
- `products` – unique product category and price combinations
- `fact_transactions` – transaction-level data

This structure enables efficient joins and analysis across customer and product dimensions.

## Analysis Performed
The following analyses were conducted:

- Revenue performance by product category
- Top customers by total spend
- Monthly revenue trends
- Customer churn analysis
- Product return analysis
- Payment method performance

## Key Insights
- Monthly revenue remained relatively stable over time
- Average order value remained consistent (~£2,700)
- Churn rate was approximately 25%
- Churned customers showed similar spending behaviour to active customers
- Some product categories showed notably high return rates
- Credit card was the most frequently used payment method

## Project Structure
```text
ecommerce-sql-analysis/
│
├── README.md
└── sql/
    ├── 01_schema_inspection.sql
    ├── 02_data_quality_checks.sql
    ├── 03_data_cleaning.sql
    ├── 04_data_model.sql
    ├── 05_analysis_queries.sql
    └── 06_key_insights.sql
```

## How to Use
Run the SQL files in sequence to follow the workflow:
1. Inspect the data
2. Check data quality
3. Clean and prepare the dataset
4. Build the data model
5. Run analysis queries

## Author
Jack Hall
