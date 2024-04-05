SELECT
  order_id,
  user_id,
  product_id,
  status
FROM
  {{ ref("stgOrderItems") }}