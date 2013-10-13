CREATE OR REPLACE VIEW invoicely_reciept_view_monthly_totals AS

SELECT 
	irvl.uid as uid,
	u.name as username,
	DATE_FORMAT(irvl.date,'%Y-%m') as yearmonth,
--	get_financial_year(irvl.date) as financial_year,
  ify.financial_year as financial_year,

  SUM(irvl.amount) as amount_cumulative,
	MIN(irvl.amount) as amount_min,
	MAX(irvl.amount) as amount_max,
	AVG(irvl.amount) as amount_average
	
FROM invoicely_reciept_view_list irvl
JOIN users u
  ON u.uid = irvl.uid
JOIN invoicely_financial_year ify
  ON ii.date_issued BETWEEN ify.year_effective_from AND ify.year_effective_to
GROUP BY yearmonth
ORDER BY yearmonth ASC