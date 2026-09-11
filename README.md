# Retail Sales SQL Analysis

## 📊 Project Overview

This project analyzes retail sales data using SQL to explore customer behavior, spending patterns, product performance, and revenue trends.

The analysis uses a retail sales dataset containing customer demographics, product categories, transaction information, and purchase amounts.

## 🎯 Objectives

The analysis investigates questions such as:

- How does revenue differ across age groups?
- How does spending vary by gender?
- Which product categories perform best across different customer groups?
- Who are the highest-value customers?
- How can customers be segmented based on spending?
- How does revenue change throughout the year?
- Which months and categories generate the most revenue?

## 🛠️ Tools & Technologies

- MySQL
- SQL
- MySQL Workbench

## 🔎 Analysis

The project uses SQL techniques including:

- `SELECT`
- `WHERE`
- `GROUP BY`
- Aggregate functions
- `CASE WHEN`
- Subqueries
- Common Table Expressions (CTEs)
- Window functions
- Data segmentation
- Date-based analysis

## 📈 Key Findings

### Customer Age Groups

The analysis found differences in both customer counts and revenue across age groups.

The **Older Adult** group generated the highest total revenue, while **Young Adults** had the highest average transaction amount.

### Gender

Female customers generated slightly more total revenue than male customers, while average spending was very similar between the two groups.

### Spending Segmentation

Customers were categorized into High, Medium, and Low spending groups.

The High Spender segment generated a disproportionately large share of total revenue despite representing a much smaller portion of customers.

### Product Categories

The strongest-performing product category varied across age groups, demonstrating that purchasing behavior differs among customer segments.

### Monthly Revenue

Revenue varied considerably throughout the year, with some months substantially outperforming others.

## 💡 Business Insights

The analysis suggests that customer segmentation can help identify high-value customers and differences in purchasing behavior.

Understanding these patterns could help a retailer:

- Target high-value customers
- Develop age-specific marketing strategies
- Identify strong and weak sales periods
- Optimize product promotions
- Better understand customer purchasing behavior

## 📁 Repository Structure

```text
retail-sales-sql-analysis/
│
├── README.md
├── retail_sales_dataset.csv
│
└── sql/
    └── retail_sales_analysis.sql
