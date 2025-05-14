SELECT
  ROW_NUMBER() OVER (ORDER BY e.DATE_OF_EVICTION, e.DOCKET_NUMBER) AS eviction_id,
  TO_CHAR(e.DATE_OF_EVICTION, 'YYYY-MM-DD') AS date_id,
  loc.location_id,
  pt.property_type_id,
  1 AS count_evictions
FROM EVICTION e
JOIN dim_location loc
  ON e.BOROUGH = loc.borough AND e.ZIPCODE = loc.zipcode
JOIN dim_property_type pt
  ON e.POPERTY_TYPE = pt.type_name
WHERE e.POPERTY_TYPE IN ('Commercial', 'Residential')
