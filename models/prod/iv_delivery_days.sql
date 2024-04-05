WITH
  deliveryTime AS (
  SELECT
    order_id,
    user_id,
    product_id,
    status,
    DATE(created_at) AS order_date,
    DATE(delivered_at) AS delivery_date
  FROM
    {{ ref("stgOrderItems") }})
SELECT
  order_id,
  user_id,
  product_id,
  status,
  DATE_DIFF(order_date, delivery_date, day) AS waiting_time
FROM
  deliveryTime
WHERE
  status = 'Complete'