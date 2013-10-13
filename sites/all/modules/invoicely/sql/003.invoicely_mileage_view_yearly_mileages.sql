CREATE OR REPLACE VIEW  {invoicely_mileage_view_yearly_mileages} AS
SELECT
  imv.uid AS uid,
  imv.username AS username,
  imv.year AS year,
  imv.financial_year AS financial_year,
  sum(imv.distance) AS distance,
  if((sum(imv.distance) > 10000),10000,sum(imv.distance)) AS distance_high_rate,
  if((sum(imv.distance) > 10000),(sum(imv.distance) - 10000),0) AS distance_low_rate
FROM
  invoicely_mileage_view imv
GROUP BY
  imv.financial_year