-- models/dim_date.sql

SELECT
  TO_CHAR(date_of_eviction, 'YYYYMMDD')::INT AS date_id,
  EXTRACT(YEAR FROM date_of_eviction) AS year,
  EXTRACT(MONTH FROM date_of_eviction) AS month,
  EXTRACT(QUARTER FROM date_of_eviction) AS quarter
FROM EVICTION 
WHERE date_of_eviction IS NOT NULL
GROUP BY 1, 2, 3, 4
