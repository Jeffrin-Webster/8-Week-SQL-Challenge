# 🍔 Clique Bait - SQL Case Study

## 🚀 About the Project

This case study strengthens SQL and data analysis skills by answering real-world business questions based on a fictional e-commerce website, **Clique Bait**.  
This project helps develop SQL querying, joins, aggregations, and more advanced concepts such as filtering, subqueries, and calculating percentages.

---

## 📂 Database and Tables

**Database:** `clique_bait`

**Tables:**
- `event_identifier` – Defines events that users can trigger on the website (`event_id`, `event_type`, `event_name`)
- `users` – Contains information about the users visiting the website (`user_id`, `cookie_id`, `start_date`)
- `page_hierarchy` – Contains details of the website's page hierarchy (`page_id`, `page_name`, `product_category`, `product_id`)
- `campaign_identifier` – Stores information about ongoing product campaigns (`campaign_id`, `products`, `campaign_name`, `start_date`, `end_date`)
- `events` – Tracks user events on different pages (`visit_id`, `cookie_id`, `page_id`, `event_type`, `sequence_number`, `event_time`)

---

## 🛠️ Setup Instructions

1. **Create the database and select it:**

    ```sql
    CREATE DATABASE IF NOT EXISTS clique_bait;
    USE clique_bait;
    ```

2. **Create the tables:**
    - `event_identifier`
    - `users`
    - `page_hierarchy`
    - `campaign_identifier`
    - `events`

3. **Insert the provided sample data** into each table.

4. **Run the SQL queries** to solve business questions.

---

## 🧠 Skills Practiced

- SQL Joins (INNER JOIN, LEFT JOIN)
- Aggregations with `COUNT`, `ROUND`, and `SUM`
- Filtering using `WHERE`, `CASE`, and `DATE_FORMAT`
- Subqueries and Nested Queries
- Data manipulation and percentage calculations
- Grouping and sorting results

---

## 📢 Credits

Built by Jeffrin Webster using **MySQL**  
This project helps improve SQL skills and enhances problem-solving abilities by answering questions related to a fictional e-commerce platform.
