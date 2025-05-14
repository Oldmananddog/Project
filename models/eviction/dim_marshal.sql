-- models/dim_marshal.sql


SELECT
  ROW_NUMBER() OVER (ORDER BY marshal_last_name, marshal_first_name) AS marshal_id,
  marshal_first_name AS first_name,
  marshal_last_name AS last_name,
  borough,
  CONCAT(marshal_first_name, ' ', marshal_last_name) AS full_name
FROM (
  SELECT DISTINCT marshal_first_name, marshal_last_name, borough
  FROM EVICTION
  WHERE marshal_first_name IS NOT NULL AND marshal_last_name IS NOT NULL
) sub
