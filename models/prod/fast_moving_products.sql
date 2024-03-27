WITH
  iv AS (
  SELECT
    product_id,
    DATE(created_at) AS date_created,
    TIME(created_at) AS time_created,
    DATE(sold_at) AS sold_date,
    TIME(sold_at) AS sold_time,
    cost,
    product_category,
    product_name,
    product_brand,
    product_retail_price,
    product_department,
    product_distribution_center_id
  FROM
    {{ ref("stgInventoryItems") }})
SELECT
  product_id,
  product_category,
  product_name,
  product_brand,
  DATETIME_DIFF(sold_date, date_created, day) AS days_in_stock
FROM
  iv
WHERE
  sold_date IS NOT NULL
ORDER BY
  days_in_stock ASC