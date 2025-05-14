

SELECT
  ROW_NUMBER() OVER (ORDER BY poperty_type) AS property_type_id,
  poperty_type AS type_name
FROM (
  SELECT DISTINCT poperty_type
  FROM EVICTION
  WHERE poperty_type IN ('Residential', 'Commercial')
) sub
