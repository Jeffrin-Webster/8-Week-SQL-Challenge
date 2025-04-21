-- 1. Create Database and Use It
CREATE DATABASE clique_bait;
USE clique_bait;

show tables;

-- 2. event_identifier Table
CREATE TABLE event_identifier (
   event_id INT PRIMARY KEY AUTO_INCREMENT,
   event_type VARCHAR(255) NOT NULL,
   event_name VARCHAR(255) NOT NULL
);

INSERT INTO event_identifier (event_type, event_name) VALUES
('page_view', 'View Page'),
('add_to_cart', 'Add to Cart'),
('purchase', 'Complete Purchase'),
('checkout', 'Checkout Page');

-- 3. users Table
CREATE TABLE users (
   user_id INT PRIMARY KEY AUTO_INCREMENT,
   cookie_id VARCHAR(255) NOT NULL UNIQUE,
   start_date DATE NOT NULL
);

INSERT INTO users (cookie_id, start_date) VALUES
('abc123', '2023-01-01'),
('def456', '2023-02-15'),
('ghi789', '2023-03-10');

-- 4. page_hierarchy Table
CREATE TABLE page_hierarchy (
   page_id INT PRIMARY KEY AUTO_INCREMENT,
   page_name VARCHAR(255) NOT NULL,
   product_category VARCHAR(255) NOT NULL,
   product_id INT NOT NULL
);

INSERT INTO page_hierarchy (page_name, product_category, product_id) VALUES
('Home Page', 'Electronics', 101),
('Product Page', 'Electronics', 102),
('Checkout Page', 'Electronics', 103),
('Confirmation Page', 'Electronics', 104);

-- 5. campaign_identifier Table
CREATE TABLE campaign_identifier (
   campaign_id INT PRIMARY KEY AUTO_INCREMENT,
   products VARCHAR(255) NOT NULL,
   campaign_name VARCHAR(255) NOT NULL,
   start_date DATE NOT NULL,
   end_date DATE NOT NULL
);

INSERT INTO campaign_identifier (products, campaign_name, start_date, end_date) VALUES
('101,102', 'New Year Sale', '2023-01-01', '2023-01-31'),
('103,104', 'Spring Deals', '2023-03-01', '2023-03-31');

-- 6. events Table
CREATE TABLE events (
   visit_id INT PRIMARY KEY AUTO_INCREMENT,
   cookie_id VARCHAR(255) NOT NULL,
   page_id INT NOT NULL,
   event_type VARCHAR(255) NOT NULL,
   sequence_number INT NOT NULL,
   event_time DATETIME NOT NULL,
   FOREIGN KEY (cookie_id) REFERENCES users(cookie_id),
   FOREIGN KEY (page_id) REFERENCES page_hierarchy(page_id)
);

INSERT INTO events (cookie_id, page_id, event_type, sequence_number, event_time) VALUES
('abc123', 1, 'page_view', 1, '2023-01-01 10:00:00'),
('abc123', 2, 'add_to_cart', 2, '2023-01-01 10:05:00'),
('def456', 3, 'checkout', 3, '2023-02-15 11:00:00'),
('ghi789', 3, 'purchase', 4, '2023-03-10 12:00:00'),
('abc123', 4, 'purchase', 5, '2023-03-10 12:15:00'),
('ghi789', 2, 'page_view', 6, '2023-03-11 14:00:00'),
('def456', 4, 'checkout', 7, '2023-03-15 15:00:00');

--  Questions and Answers Section

-- 1. How many users are there?
SELECT COUNT(*) AS total_users FROM users;

-- 2. How many cookies does each user have on average?
-- Since 1 cookie per user in current dataset, avg is 1.00
-- But here's the general structure:
SELECT ROUND(COUNT(cookie_id) * 1.0 / COUNT(user_id), 2) AS avg_cookies_per_user FROM users;

-- 3. What is the unique number of visits by all users per month?

SELECT 
    DATE_FORMAT(event_time, '%Y-%m') AS month,
    COUNT(DISTINCT visit_id) AS unique_visits
FROM 
    events
GROUP BY 
    DATE_FORMAT(event_time, '%Y-%m')
ORDER BY 
    month;


-- 4. Number of events per event type
SELECT event_type, COUNT(*) AS event_count
FROM events
GROUP BY event_type;

-- 5. % of visits with a purchase event
SELECT
  ROUND(COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN visit_id END) * 100.0 / COUNT(DISTINCT visit_id), 2) AS purchase_percentage
FROM events;

-- 6. % of visits with checkout view but no purchase
SELECT
  ROUND(
    COUNT(DISTINCT CASE
      WHEN ph.page_name = 'Checkout Page' AND e.event_type != 'purchase' THEN e.visit_id
    END) * 100.0 /
    COUNT(DISTINCT CASE WHEN ph.page_name = 'Checkout Page' THEN e.visit_id END),
  2) AS checkout_no_purchase_percentage
FROM events e
JOIN page_hierarchy ph ON e.page_id = ph.page_id;

-- 7. Top 3 pages by number of views
SELECT 
    ph.page_name, 
    COUNT(e.visit_id) AS page_views
FROM 
    events e
JOIN 
    page_hierarchy ph ON e.page_id = ph.page_id
WHERE 
    e.event_type = 'page_view'
GROUP BY 
    ph.page_name
ORDER BY 
    page_views DESC
LIMIT 3;

-- 8. Views and add to carts per product category
SELECT 
    ph.product_category, 
    COUNT(CASE WHEN e.event_type = 'page_view' THEN 1 END) AS page_views,
    COUNT(CASE WHEN e.event_type = 'add_to_cart' THEN 1 END) AS cart_adds
FROM 
    events e
JOIN 
    page_hierarchy ph ON e.page_id = ph.page_id
GROUP BY 
    ph.product_category
ORDER BY 
    page_views DESC;

-- 9. Top 3 products by purchases
SELECT 
    ph.page_name AS product_name,
    COUNT(e.visit_id) AS purchase_count
FROM 
    events e
JOIN 
    page_hierarchy ph ON e.page_id = ph.page_id
WHERE 
    e.event_type = 'purchase'
GROUP BY 
    ph.page_name
ORDER BY 
    purchase_count DESC
LIMIT 3;

-- 10. Unique number of visits by month
SELECT 
    MONTH(event_time) AS month,
    COUNT(DISTINCT visit_id) AS unique_visits
FROM 
    events
GROUP BY 
    MONTH(event_time)
ORDER BY 
    month;
