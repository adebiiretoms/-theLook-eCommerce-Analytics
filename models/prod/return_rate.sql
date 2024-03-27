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
  dc.id AS dc_id,
  dc.name AS dc_name,
  DATE(oi.returned_at) AS return_date,
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
WHERE
  oi.returned_at IS NOT null