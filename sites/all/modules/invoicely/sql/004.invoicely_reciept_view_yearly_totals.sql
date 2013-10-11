CREATE OR REPLACE VIEW {invoicely_reciept_view_yearly_totals} AS

SELECT 
	irvmt.uid,
	irvmt.username,
	irvmt.financial_year,
	SUM(irvmt.amount_cumulative) as amount_cumulative
FROM 
	invoicely_reciept_view_monthly_totals irvmt
GROUP BY
	irvmt.financial_year