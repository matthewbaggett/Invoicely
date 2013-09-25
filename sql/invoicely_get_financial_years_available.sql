CREATE OR REPLACE VIEW invoicely_get_financial_years_available AS
SELECT 
	iivmt.`financial_year`,
	iivmt.`uid`
FROM invoicely_invoice_view_monthly_totals iivmt
GROUP BY iivmt.`financial_year`