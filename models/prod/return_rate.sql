SELECT
  oi.order_id,
  oi.user_id,
  us.age,
  us.gender,
  us.city,
  us.state,
  us.country,
  us. traffic_source,
  oi.product_id,
  pr.category,
  pr.name,
  pr.brand,
  pr.department,
  pr.retail_price,
  dc.id AS dc_id,
  dc.name AS dc_name,
  ord.num_of_item,
  DATE(oi.returned_at) AS return_date
FROM
  {{ ref("stgOrderItems") }} AS oi
LEFT JOIN
  {{ ref("stgProducts") }} AS pr
ON
  pr.id = oi.product_id
LEFT JOIN
  {{ ref("stgUsers") }} AS us
ON
  us.id = oi.user_id
LEFT JOIN
  {{ ref("stgDistributionCentre") }} AS dc
ON
  dc.id = pr.distribution_center_id
LEFT JOIN
  {{ ref("stgOrders") }} AS ord
ON
  oi.order_id = ord.order_id
WHERE
  oi.returned_at IS NOT null