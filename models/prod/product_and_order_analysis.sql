SELECT
  pr.id,
  pr.cost,
  pr.category,
  pr.name,
  pr.brand,
  pr.retail_price,
  pr.department,
  pr.distribution_center_id,
  ord.order_id,
  ord.user_id,
  ord.gender,
  ord.num_of_item,
  oi.status
FROM
  {{ ref("stgProducts") }} AS pr
LEFT JOIN
  {{ ref("stgOrderItems") }} AS oi
ON
  pr.id = oi.product_id
LEFT JOIN
  {{ ref("stgOrders") }} AS ord
ON
  oi.order_id = ord.order_id