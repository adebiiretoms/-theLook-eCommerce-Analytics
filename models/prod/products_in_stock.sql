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
  count(product_id) as no_of_goods_in_stock
FROM
  iv
WHERE
  sold_date IS NULL
GROUP BY 
    1, 2, 3, 4
ORDER BY
  5 DESC