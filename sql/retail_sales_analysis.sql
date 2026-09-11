-- ============================================================
-- Retail Sales SQL Analysis
-- Author: Melanie Lytell
-- Tool: MySQL / MySQL Workbench
--
-- This file contains the 23 SQL analysis questions completed
-- for the Retail Sales Analysis project.
-- ============================================================

-- Question 1
#Count the different number of customers
SELECT COUNT(DISTINCT `Customer ID`) AS unique_customers
FROM retail_sales_dataset;

-- Question 2
#Total revenue from all transactions
SELECT SUM(`Total Amount`)
FROM retail_sales_dataset;

-- Question 3 
#On average, how much money does the company make per transaction?
SELECT AVG(`Total Amount`) AS avg_transaction 
FROM retail_sales_dataset;

-- Question 4
# How many individual items were sold across all transactions 
SELECT SUM(`Quantity`) AS totalunitssold
FROM retail_sales_dataset;

-- Question 5 
#Average number of items per transaction
SELECT AVG(`Quantity`) AS avgitemspertransaction
FROM retail_sales_dataset;

-- Question 6 
#Which product category generates the most revenue 
SELECT `Product Category`, SUM(`Total Amount`)
FROM retail_sales_dataset
GROUP BY `Product Category`;

-- Question 7
#Which product category generates the most revenue (easier to read)
SELECT `Product Category`, SUM(`Total Amount`) AS total_revenue
FROM retail_sales_dataset
GROUP BY `Product Category`;

-- Question 8
#Sort the categories
SELECT `Product Category`, SUM(`Total Amount`) AS total_revenue
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_revenue DESC;

-- Question 9
#Sort the categories
SELECT `Product Category`, SUM(`Quantity`) AS total_units
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY total_units DESC;

-- Question 10
#Revenue per item
SELECT `Product Category`, SUM(`Quantity`) AS total_units, SUM(`Total Amount`)/SUM(`Quantity`) AS revenue_per_item
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY revenue_per_item DESC;

-- Question 11 
# Monthly Revenue
SELECT MONTH(`Date`) AS month, SUM(`Total Amount`) AS monthly_revenue
FROM retail_sales_dataset
GROUP BY month
ORDER BY month;

-- Question 12
# Revenue in order
SELECT MONTH(`Date`) AS month, SUM(`Total Amount`) AS monthly_revenue
FROM retail_sales_dataset
GROUP BY month
ORDER BY monthly_revenue DESC;

-- Question 13 
# Percentage of Revenue from Each Category
SELECT 
    `Product Category`,
    SUM(`Total Amount`) AS category_revenue,
    SUM(`Total Amount`) / (
        SELECT SUM(`Total Amount`)
        FROM retail_sales_dataset
    ) * 100 AS revenue_percentage
FROM retail_sales_dataset
GROUP BY `Product Category`;

-- Question 14
# Revenue by Gender
SELECT `Gender`, SUM(`Total Amount`) AS totalrevenue
FROM retail_sales_dataset
GROUP BY `Gender`;

-- Question 15
# Average Transaction amount by Gender
SELECT `Gender`, AVG(`Total Amount`) AS avgtransaction
FROM retail_sales_dataset
GROUP BY `Gender`;

-- Question 16 
#Revenue by age group
SELECT
    CASE
        WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
        WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
        WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
        ELSE '55+'
    END AS age_group,
    SUM(`Total Amount`) AS total_revenue
FROM retail_sales_dataset
GROUP BY
    CASE
        WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
        WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
        WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
        ELSE '55+'
    END
ORDER BY total_revenue DESC;

-- Question 17
# Count age group
SELECT
    CASE
        WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
        WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
        WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS customer_count
FROM retail_sales_dataset
GROUP BY
    CASE
        WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
        WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
        WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
        ELSE '55+'
    END
ORDER BY customer_count DESC;

-- Question 18
#Average spending by age group
SELECT
    CASE
        WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
        WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
        WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
        ELSE '55+'
    END AS age_group,
    AVG(`Total Amount`) AS avg_spending
FROM retail_sales_dataset
GROUP BY
    CASE
        WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
        WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
        WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
        ELSE '55+'
    END
ORDER BY avg_spending DESC;

-- Question 19
#Which category is most popular within each age group
SELECT
    CASE
        WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
        WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
        WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
        ELSE '55+'
    END AS age_group,
    SUM(`Total Amount`) AS total_revenue,
    `Product Category`
FROM retail_sales_dataset
GROUP BY
    CASE
        WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
        WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
        WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
        ELSE '55+'
    END,
    `Product Category`
ORDER BY age_group, total_revenue DESC;

-- Question 20
#Biggest Category for each age group
WITH category_revenue AS (
SELECT
    CASE
        WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
        WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
        WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
        ELSE '55+'
    END AS age_group,
    SUM(`Total Amount`) AS total_revenue,
    `Product Category`
FROM retail_sales_dataset
GROUP BY
    CASE
        WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
        WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
        WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
        WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
        ELSE '55+'
    END,
    `Product Category`
)
SELECT
    age_group,
    `Product Category`,
    total_revenue,
    RANK() OVER (
        PARTITION BY age_group
        ORDER BY total_revenue DESC
    ) AS category_rank
FROM category_revenue
ORDER BY age_group, category_rank;

-- Question 21 
# show #1 Category
-- Question 21
-- Show only the biggest category for each age group

WITH category_revenue AS (
    SELECT
        CASE
            WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
            WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
            WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
            WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
            ELSE '55+'
        END AS age_group,
        `Product Category`,
        SUM(`Total Amount`) AS total_revenue
    FROM retail_sales_dataset
    GROUP BY
        CASE
            WHEN `Age` BETWEEN 18 AND 24 THEN 'Young Adult'
            WHEN `Age` BETWEEN 25 AND 34 THEN 'Adult'
            WHEN `Age` BETWEEN 35 AND 44 THEN 'Middle Adult'
            WHEN `Age` BETWEEN 45 AND 54 THEN 'Older Adult'
            ELSE '55+'
        END,
        `Product Category`
),

ranked_categories AS (
    SELECT
        age_group,
        `Product Category`,
        total_revenue,
        RANK() OVER (
            PARTITION BY age_group
            ORDER BY total_revenue DESC
        ) AS category_rank
    FROM category_revenue
)

SELECT
    age_group,
    `Product Category`,
    total_revenue
FROM ranked_categories
WHERE category_rank = 1
ORDER BY age_group;

-- Question 22 
#Month over Month Revenue 
WITH monthly_revenue AS (
    SELECT
        MONTH(`Date`) AS month,
        SUM(`Total Amount`) AS monthly_revenue
    FROM retail_sales_dataset
    GROUP BY MONTH(`Date`)
)

SELECT
    month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (
        ORDER BY month
    ) AS previous_month_revenue,
    monthly_revenue - LAG(monthly_revenue) OVER (
        ORDER BY month
    ) AS revenue_change,
    (
        monthly_revenue - LAG(monthly_revenue) OVER (
            ORDER BY month
        )
    ) / LAG(monthly_revenue) OVER (
        ORDER BY month
    ) * 100 AS revenue_growth_percentage
FROM monthly_revenue
ORDER BY month;

-- Question 23 
#How much does each customer spend
WITH customer_spending AS (
    SELECT
        `Customer ID`,
        SUM(`Total Amount`) AS customer_total_spend,
        CASE
            WHEN SUM(`Total Amount`) < 300 THEN 'Low Spender'
            WHEN SUM(`Total Amount`) < 1000 THEN 'Medium Spender'
            ELSE 'High Spender'
        END AS spending_group
    FROM retail_sales_dataset
    GROUP BY `Customer ID`
)
SELECT
    spending_group,
    COUNT(*) AS customer_count,
    SUM(customer_total_spend) AS total_revenue,
    AVG(customer_total_spend) AS average_customer_spend
FROM customer_spending
GROUP BY spending_group
ORDER BY average_customer_spend DESC;
