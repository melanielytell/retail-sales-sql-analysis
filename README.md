# Retail Sales SQL Analysis

## Project Overview

This project analyzes retail sales data using SQL to explore customer behavior, spending patterns, product performance, and revenue trends.

The analysis uses a retail sales dataset containing customer demographics, product categories, transaction information, and purchase amounts.

## Objectives

The analysis investigates questions such as:

- How does revenue differ across age groups?
- How does spending vary by gender?
- Which product categories perform best across different customer groups?
- Who are the highest-value customers?
- How can customers be segmented based on spending?
- How does revenue change throughout the year?
- Which months and categories generate the most revenue?

## Tools & Technologies

- MySQL
- SQL
- MySQL Workbench

## Analysis

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

## Key Findings

### Customer Age Groups

| Age Group | Transactions | Revenue | Avg. Transaction |
|---|---:|---:|---:|
| Older Adult | 225 | $97,235 | $432.16 |
| Adult | 203 | $97,090 | $478.28 |
| Middle Adult | 207 | $96,835 | $467.80 |
| 55+ | 216 | $90,190 | $417.55 |
| Young Adult | 149 | $74,650 | $501.01 |

The **Older Adult** group generated the highest total revenue at **$97,235**, while **Young Adults** had the highest average transaction amount at approximately **$501**.

### Gender

| Gender | Revenue | Avg. Transaction |
|---|---:|---:|
| Female | $232,840 | $456.55 |
| Male | $223,160 | $455.43 |

Female customers generated slightly more total revenue than male customers, while average transaction amounts were nearly identical.

### Customer Spending Segments

| Segment | Customers | Revenue | Avg. Customer Spending |
|---|---:|---:|---:|
| High | 202 | $286,800 | $1,419.80 |
| Medium | 194 | $116,100 | $598.45 |
| Low | 604 | $53,100 | $87.91 |

The **High Spender** segment contained only 202 customers but generated **$286,800 in revenue**, making this group particularly important from a customer-value perspective.

### Top Product Categories by Age Group

The highest-revenue category differed across age groups:

- **55+** — Electronics: $38,210
- **Adult** — Clothing: $41,640
- **Middle Adult** — Electronics: $36,460
- **Older Adult** — Beauty: $35,950
- **Young Adult** — Beauty: $28,905

This suggests that product preferences vary across customer age groups.

### Monthly Revenue

Monthly revenue varied substantially throughout the year.

**Highest revenue month:** May — **$53,150**

**Lowest revenue month:** September — **$23,620**

This represents a difference of **$29,530** between the strongest and weakest months.

## Business Insights

Based on the analysis, several potential business opportunities emerge:

- Focus customer-retention efforts on high-value customers.
- Consider age-specific product promotions based on category preferences.
- Investigate the factors contributing to strong May sales.
- Explore why September revenue was substantially lower.
- Use customer spending segments to develop targeted marketing strategies.

## Repository Structure

```text
retail-sales-sql-analysis/
│
├── README.md
├── retail_sales_dataset.csv
│
└── sql/
    └── retail_sales_analysis.sql
