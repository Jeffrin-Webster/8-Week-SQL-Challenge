# 🛒 Balanced Tree Clothing - SQL Project

## 📚 Project Overview
This project involves creating a database system for managing **Products**, **Sales**, **Categories**, and **Segments**. It also includes writing SQL queries to perform **sales analysis**, **member vs non-member comparisons**, **revenue calculations**, and more.

---

## 🛠️ Database Design

### 1. Database: `Products`

### 2. Tables:

- **Products**
  - `product_id` (Primary Key)
  - `Price`
  - `Product_name`
  - `Category_id`
  - `Segment_id`

- **Product_Sales**
  - `prod_id` (Foreign Key → Products)
  - `qty`
  - `price`
  - `discount`
  - `member` (Boolean)
  - `txn_id` (Primary Key)
  - `Start_txn_time`

- **Product_Hierarchy**
  - `price_id` (Primary Key)
  - `Parent_id` (Foreign Key → Product_Hierarchy)
  - `level_text`
  - `level_name`

- **Categories**
  - `category_id` (Primary Key)
  - `category_name`

- **Segments**
  - `segment_id` (Primary Key)
  - `segment_name`

---

## 💾 Setup Instructions

1. **Create and Use the Database**
   ```sql
   CREATE DATABASE IF NOT EXISTS Products;
   USE Products;
