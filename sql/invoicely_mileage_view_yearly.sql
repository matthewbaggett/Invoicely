CREATE OR REPLACE VIEW invoicely_mileage_view_yearly AS
SELECT 
	imv.`year`,
	SUM(imv.`distance`) as distance
FROM invoicely_mileage_view imv