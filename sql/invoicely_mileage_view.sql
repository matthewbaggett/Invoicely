CREATE OR REPLACE VIEW invoicely_mileage_view AS
SELECT 
	m.`uid`, 
	m.`date`, 
	m.`direction`,
	r.`name` as route_name,
	IF(m.`direction` = 'Return', r.distance*2, r.distance) as `distance`,
	YEAR(m.`date`) as `year`

FROM invoicely_mileage m
JOIN invoicely_mileage_route r
  ON r.`rid` = m.`rid`
JOIN users u
  ON u.`uid` = m.`uid`
