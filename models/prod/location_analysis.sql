SELECT
  us,
  ord,
  dc
FROM
  {{ ref("stgUsers") }} AS us
LEFT JOIN
  {{ ref("stgOrders") }} AS ord
ON
  us.id = ord.user_id
LEFT JOIN
  {{ ref("stgOrderItems") }} AS oi
ON
  oi.user_id = us.id
LEFT JOIN
  {{ ref("stgProducts") }} AS pr
ON
  pr.id =oi.product_id
LEFT JOIN
  {{ ref("stgDistributionCentre") }} AS dc
ON
  dc.id = pr.distribution_center_id