-- models/dim_location.sql


SELECT
  ROW_NUMBER() OVER (ORDER BY borough, zipcode) AS location_id,
  borough,
  zipcode
FROM (
  SELECT DISTINCT borough, zipcode
  FROM EVICTION
  WHERE borough IS NOT NULL AND zipcode IS NOT NULL
) sub
