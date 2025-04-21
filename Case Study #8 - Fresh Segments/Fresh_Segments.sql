CREATE DATABASE IF NOT EXISTS Fresh_segments;
USE Fresh_segments;

-- Create interest_map table
CREATE TABLE IF NOT EXISTS interest_map (
    id INT PRIMARY KEY,
    interest_name VARCHAR(255),
    interest_summary TEXT,
    created_at DATE -- Added created_at column here
);

-- Insert sample interests into interest_map
INSERT INTO interest_map (id, interest_name, interest_summary, created_at) 
VALUES 
(4, 'Tech Growth', 'Technology sector experiencing rapid growth', '2024-12-01'),
(5, 'Stable', 'Industry maintaining steady growth', '2024-12-01'),
(6, 'Healthcare', 'Growing demand for healthcare services', '2024-12-01');

-- Modify the interest_metrics table to include a month_year_date column as DATE type
DROP TABLE IF EXISTS interest_metrics;
SHOW TABLES LIKE 'interest_metrics';

CREATE TABLE interest_metrics (
    month INT,
    year INT,
    month_year VARCHAR(20),
    interest_id INT,
    composition DECIMAL(5,2),
    index_value DECIMAL(5,2),
    ranki INT,
    month_year_date DATE, -- Month Year Date Column for date conversion
    FOREIGN KEY (interest_id) REFERENCES interest_map(id)
);

-- Insert sample metrics into interest_metrics

INSERT INTO interest_metrics (month, year, month_year, interest_id, composition, index_value, ranki) 
VALUES
(1, 2025, 'January-2025', 1, 45.0, 75.3, 1),
(2, 2025, 'February-2025', 2, 55.0, 80.5, 2),
(3, 2025, 'March-2025', 3, 60.0, 88.9, 3);

-- #1 Update the interest_metrics table with proper month_year_date column as DATE type

UPDATE interest_metrics
SET month_year_date = STR_TO_DATE(CONCAT('01-', month_year), '%d-%M-%Y');

-- #2 Count of records in interest_metrics for each month_year value sorted in chronological order (earliest to latest)

SELECT 
    month_year,
    COUNT(*) AS record_count
FROM 
    interest_metrics
GROUP BY 
    month_year
ORDER BY 
    month_year IS NULL,
    STR_TO_DATE(CONCAT('01-', month_year), '%d-%M-%Y');

-- #3 Find interest_id values in interest_metrics but not in interest_map and vice versa
-- interest_id in interest_metrics but not in interest_map

SELECT COUNT(*) 
FROM interest_metrics 
WHERE interest_id NOT IN (SELECT id FROM interest_map);

-- interest_id in interest_map but not in interest_metrics
SELECT COUNT(*) 
FROM interest_map 
WHERE id NOT IN (SELECT interest_id FROM interest_metrics);

-- #4 Summarize the id values in interest_map by total record count

SELECT COUNT(id) AS total_records
FROM interest_map;

-- #5 Join interest_metrics and interest_map for analysis (Check logic for interest_id = 21246)

SELECT 
    im.*,  -- All columns from interest_metrics
    mp.interest_name,
    mp.interest_summary
FROM 
    interest_metrics im
LEFT JOIN 
    interest_map mp
ON 
    im.interest_id = mp.id
WHERE 
    im.interest_id = 21246;


-- #6 Find which interests have been present in all month_year dates
WITH total_months AS (
    SELECT COUNT(DISTINCT month_year) AS total_count
    FROM interest_metrics
),
interest_months AS (
    SELECT interest_id, COUNT(DISTINCT month_year) AS interest_months_count
    FROM interest_metrics
    GROUP BY interest_id
)
SELECT im.interest_id, mp.interest_name
FROM interest_months im
JOIN total_months tm 
  ON im.interest_months_count = tm.total_count
JOIN interest_map mp 
  ON im.interest_id = mp.id;

-- #7 Calculate the cumulative percentage starting at 14 months
SELECT 
    total_months,
    record_count,
    @cumulative_sum := @cumulative_sum + record_count AS cumulative_sum,
    ROUND(@cumulative_sum * 100 / @total_records, 2) AS cumulative_percent
FROM (
    SELECT 
        imos.interest_id,
        COUNT(DISTINCT im.month_year) AS total_months,
        COUNT(*) AS record_count
    FROM interest_metrics im
    JOIN (
        SELECT interest_id 
        FROM interest_metrics
        GROUP BY interest_id
        HAVING COUNT(DISTINCT month_year) >= 14
    ) imos ON im.interest_id = imos.interest_id
    GROUP BY imos.interest_id
) AS interest_data
JOIN (
    SELECT @cumulative_sum := 0, 
           @total_records := (
               SELECT COUNT(*) 
               FROM interest_metrics im
               JOIN (
                   SELECT interest_id 
                   FROM interest_metrics
                   GROUP BY interest_id
                   HAVING COUNT(DISTINCT month_year) >= 14
               ) imos ON im.interest_id = imos.interest_id
           )
) vars
ORDER BY total_months;

-- #8 Find how many data points would be removed if interest_id values are lower than the total_months value from previous question

SELECT COUNT(*) AS records_to_remove
FROM interest_metrics im
JOIN (
    SELECT interest_id, COUNT(DISTINCT month_year) AS total_months
    FROM interest_metrics
    GROUP BY interest_id
    HAVING total_months < 17  -- Replace 17 with the actual cutoff value
) low_months
ON im.interest_id = low_months.interest_id;

-- #9 After removing these interests, how many unique interests are there for each month?

WITH valid_interests AS (
    SELECT interest_id
    FROM interest_metrics
    GROUP BY interest_id
    HAVING COUNT(DISTINCT month_year) >= 17  -- Replace 17 with the actual cutoff value
)
SELECT 
    month_year,
    COUNT(DISTINCT im.interest_id) AS unique_valid_interests
FROM interest_metrics im
JOIN valid_interests vi 
    ON im.interest_id = vi.interest_id
GROUP BY month_year
ORDER BY month_year;
