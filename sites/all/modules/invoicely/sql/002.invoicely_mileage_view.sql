CREATE OR REPLACE VIEW invoicely_mileage_view AS
SELECT 
	m.uid,
	u.name as username,
	m.date,
	m.direction,
	r.name as route_name,
	IF(m.direction = 'Return', r.distance*2, r.distance) as distance,
	YEAR(m.date) as year,
	MONTH(m.date) as month,
	CONCAT(YEAR(m.date), '-', MONTH(m.date)) as yearmonth,
	-- get_financial_year(m.date) as financial_year
  ify.financial_year as financial_year


FROM invoicely_mileage m
JOIN invoicely_mileage_route r
  ON r.rid = m.rid
JOIN users u
  ON u.uid = m.uid
JOIN invoicely_financial_year ify
  ON ii.date_issued BETWEEN ify.year_effective_from AND ify.year_effective_to
