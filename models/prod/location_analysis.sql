SELECT
  pr.distribution_center_id,
  dc.name,
  pr.id,
  pr.category,
  pr.department,
  oi.order_id,
  oi.user_id,
FROM
  {{ ref("stgDistributionCentre") }} AS dc
LEFT JOIN
  {{ ref("stgProducts") }} AS pr
ON
  dc.id = pr.distribution_center_id
LEFT JOIN
  {{ ref("stgOrderItems") }} AS oi
ON
  pr.id = oi.product_id