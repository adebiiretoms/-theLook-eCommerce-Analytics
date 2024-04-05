SELECT
  oi.user_id,
  CONCAT(us.first_name, ' ', us.last_name) AS full_name,
  us.age,
  us.gender,
  us.state,
  us.city,
  us.country,
  us.traffic_source,
  oi.id,
  oi.order_id,
  oi.product_id,
  oi.inventory_item_id,
  status,
  DATE(oi.created_at) AS date_created,
  TIME(oi.created_at) AS time_created,
  DATE(oi.shipped_at) AS ship_date,
  TIME(oi.shipped_at)AS ship_time,
  DATE(oi.delivered_at) AS delivery_date,
  TIME(oi.delivered_at) AS delivery_time,
  DATE(oi.returned_at) AS return_date,
  TIME(oi.returned_at) AS return_time,
  sale_price
FROM
  {{ ref("stgUsers") }} AS us
LEFT JOIN
  {{ ref("stgOrderItems") }} AS oi
ON
  oi.user_id = us.id
WHERE 
    oi.id is not null