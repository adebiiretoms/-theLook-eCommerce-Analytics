SELECT
  id,
  CONCAT(first_name, ' ', last_name) AS full_name,
  age,
  gender,
  city,
  state,
  country,
  traffic_source,
  DATE(created_at) AS date_created,
  TIME(created_at) AS time_created
FROM
  {{ ref("stgUsers") }}