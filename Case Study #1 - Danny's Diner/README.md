# 🍽️ Danny's Dinner - SQL Case Study

## 🚀 About the Project
This case study builds hands-on SQL skills by answering business questions using real-world styled datasets.  
It is inspired by **Danny Ma's #8WeekSQLChallenge** and focuses on practical SQL querying and data analysis techniques.

---

## 📂 Database and Tables
**Database:** `Dannys_Dinner`

**Tables:**
- `sales` – Customer orders (`customer_id`, `order_date`, `product_id`)
- `menu` – Menu items with pricing (`product_id`, `product_name`, `price`)
- `members` – Membership join dates (`customer_id`, `join_date`)

---

## 🛠️ Setup Instructions

1. **Create the database and use it:**
    ```sql
    CREATE DATABASE IF NOT EXISTS Dannys_Dinner;
    USE Dannys_Dinner;
    ```

2. **Create the tables:**
    - `sales`
    - `menu`
    - `members`

3. **Insert the provided sample data** into each table.

4. **Run the SQL queries** to solve the business questions.

---

## ❓ Business Questions Solved

- 🧮 Total amount spent by each customer.
- 📅 Number of days each customer visited the restaurant.
- 🍱 First item purchased by each customer.
- 🥇 Most purchased item on the menu.
- 🙋‍♂️ Most popular item for each customer.
- 🆕 First item purchased after becoming a member.
- ⏪ Item purchased just before becoming a member.
- 💸 Total items and total amount spent before membership.
- 🎯 Points earned by customers (with multipliers for sushi).
- 🚀 Points earned during the first week after membership.

---

## 🧠 Skills Practiced
- SQL Joins
- Aggregations
- Window Functions
- CTEs (Common Table Expressions)
- Analytical Thinking

---

## 📢 Credits
Inspired by [Danny Ma's 8 Week SQL Challenge](https://8weeksqlchallenge.com/)

---
