CREATE OR REPLACE VIEW invoicely_mileage_view_yearly_mileages AS
SELECT 
	imv.`username`,
	imv.`year`,
	imv.`financial_year`,
	SUM(imv.`distance`) as `distance`,
	IF(SUM(imv.distance) > 10000, 10000, SUM(imv.distance)) as `distance_high_rate`,
	IF(SUM(imv.distance) > 10000, SUM(imv.distance)-10000,0) as `distance_low_rate`

FROM invoicely_mileage_view imv
GROUP BY imv.`financial_year`;