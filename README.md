# SQL Challenge Solutions

This repository contains my solutions to a series of SQL challenges completed over the course of multiple weeks. These challenges helped me master key SQL concepts, including database design, data aggregation, optimization, and complex queries. Below are the case studies I have worked on, along with the approach and techniques used for each challenge.

## Challenges Completed
1. **Danny's Dinner**
2. **Pizza Runner**
3. **Foodie-Fi**
4. **Data Bank**
5. **Data Mart**
6. **Clique Bait**
7. **Balanced Tree Clothing**
8. **Fresh Segments**

## Challenge Overview

### 1. **Danny's Dinner**
- **Objective**: Design and execute SQL queries to manage a dinner reservation system for a restaurant.
- **Key Concepts**: Database design, `JOIN`, `GROUP BY`, and `HAVING`.
- **Approach**:
  - Created tables for guests, reservations, and menu items.
  - Used `JOIN` to fetch guest and reservation details together.
  - Aggregated data to find the most popular menu items.

### 2. **Pizza Runner**
- **Objective**: Analyze and optimize a pizza delivery business's sales data to determine key performance metrics.
- **Key Concepts**: `JOIN`, `SUM`, `AVG`, data aggregation, performance optimization.
- **Approach**:
  - Joins to combine order, customer, and delivery data.
  - Aggregated data to calculate total sales per customer and identify peak times.
  - Optimized the queries for performance.

### 3. **Foodie-Fi**
- **Objective**: Work on customer satisfaction data and improve the analysis of restaurant reviews.
- **Key Concepts**: Subqueries, window functions, `RANK()`, `DENSE_RANK()`.
- **Approach**:
  - Created queries to rank restaurants based on customer reviews.
  - Used `RANK()` and `DENSE_RANK()` to order restaurants by ratings within specific categories.

### 4. **Data Bank**
- **Objective**: Create an efficient system for storing and querying customer transaction data.
- **Key Concepts**: Transactions, `UPDATE`, `INSERT`, and `DELETE`.
- **Approach**:
  - Designed a schema for transaction data.
  - Ensured ACID properties for transactions.
  - Wrote queries to analyze transaction history and trends.

### 5. **Data Mart**
- **Objective**: Set up a data mart for a retail business to optimize reporting on sales data.
- **Key Concepts**: `ETL`, data warehousing, `GROUP BY`.
- **Approach**:
  - Structured data for efficient reporting.
  - Wrote ETL (Extract, Transform, Load) queries to move data from operational databases to the data mart.
  - Used `GROUP BY` and `HAVING` to summarize sales data by regions and products.

### 6. **Clique Bait**
- **Objective**: Build and query data for a social media platform to identify popular posts and user interactions.
- **Key Concepts**: `JOIN`, social network data, `GROUP BY`, and `COUNT()`.
- **Approach**:
  - Analyzed user engagement data (likes, comments, shares).
  - Wrote queries to find the top posts by engagement and the most active users.

### 7. **Balanced Tree Clothing**
- **Objective**: Analyze sales data for a clothing retailer to identify trends in product sales and customer preferences.
- **Key Concepts**: `JOIN`, `WHERE`, `COUNT()`, `AVG()`, product analysis.
- **Approach**:
  - Combined customer, product, and sales data to find best-selling items.
  - Used aggregation functions to calculate the average sales per product and category.

### 8. **Fresh Segments**
- **Objective**: Segment customers based on purchase behavior for targeted marketing campaigns.
- **Key Concepts**: `CASE` expressions, customer segmentation, `GROUP BY`.
- **Approach**:
  - Created customer segments based on purchase frequency and value.
  - Used `CASE` expressions to classify customers into segments like "high value", "frequent shopper", etc.

## Technologies Used
- **SQL Databases**: MySQL

## Setup Instructions

To run the queries and interact with the database, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Jeffrin-Webster/8-Week-SQL-Challenge
