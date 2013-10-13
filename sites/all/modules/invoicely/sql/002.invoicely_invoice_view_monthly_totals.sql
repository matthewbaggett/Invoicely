CREATE OR REPLACE VIEW invoicely_invoices_view_monthly_totals AS

SELECT
	ii.uid as uid,
	u.name as username,
	DATE_FORMAT(ii.date_issued,'%Y-%m') as yearmonth,
	get_financial_year(ii.date_issued) as financial_year,
	SUM(ii.amount_paid) as amount_paid_cumulative
FROM invoicely_invoices ii
JOIN users u
  ON u.uid = ii.uid
JOIN invoicely_financial_year ify
  ON ii.date_issued BETWEEN ify.year_effective_from AND ify.year_effective_to
GROUP BY yearmonth
ORDER BY yearmonth ASC