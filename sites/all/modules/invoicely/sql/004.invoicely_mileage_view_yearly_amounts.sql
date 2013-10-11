CREATE OR REPLACE VIEW {invoicely_mileage_view_yearly_amounts} AS
SELECT 
	imvym.`uid`,
	imvym.`username`,
	imvym.`financial_year`,
	SUM(imvym.`distance`) as `distance`,
	(imvym.distance_high_rate * 0.45) + (distance_low_rate * 0.20) as `amount`

FROM invoicely_mileage_view_yearly_mileages imvym
GROUP BY imvym.`financial_year`