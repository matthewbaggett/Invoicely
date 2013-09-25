CREATE OR REPLACE VIEW invoicely_invoice_view_monthly_totals AS

SELECT 
	ii.`uid` as `uid`,
	u.`name` as `username`,
	DATE_FORMAT(ii.`date_issued`,'%Y-%m') as `yearmonth`,
	get_financial_year(m.`date`) as `financial_year`,
	SUM(ii.`amount_paid`) as `amount_paid_cumulative`
FROM invoicely_invoices ii
JOIN users u
  ON u.`uid` = ii.`uid`
GROUP BY yearmonth
ORDER BY yearmonth ASC