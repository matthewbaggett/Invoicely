CREATE OR REPLACE VIEW invoicely_mileage_view AS
SELECT 
	m.`uid`, 
	u.`name` as `username`, 
	m.`date`, 
	m.`direction`,
	r.`name` as route_name,
	IF(m.`direction` = 'Return', r.distance*2, r.distance) as `distance`,
	YEAR(m.`date`) as `year`,
	MONTH(m.`date`) as `month`,
	CONCAT(YEAR(m.`date`), '-', MONTH(m.`date`)) as `yearmonth`,
	CASE WHEN MONTH(m.`date`)>=4 THEN
          concat(YEAR(m.`date`), '-',YEAR(m.`date`)+1)
   ELSE concat(YEAR(m.`date`)-1,'-', YEAR(m.`date`)) END AS financial_year

FROM invoicely_mileage m
JOIN invoicely_mileage_route r
  ON r.`rid` = m.`rid`
JOIN users u
  ON u.`uid` = m.`uid`
