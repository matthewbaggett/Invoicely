CREATE VIEW invoicely_mileage_export AS
SELECT 
 mv.`date` as "Date",
 mv.financial_year as "Financial Year",
 mv.route_name as "Route",
 mv.distance as "Distance (miles)"
FROM invoicely_mileage_view mv