CREATE OR REPLACE VIEW invoicely_reciept_view_list AS

SELECT 
	ir.*, 
	c.`name` as company ,
	SUM(irl.amount) as amount
FROM invoicely_receipts ir
JOIN invoicely_receipt_lines irl
  ON ir.rid = irl.rid
JOIN invoicely_companies c
  ON ir.cid = c.cid
-- WHERE `date` >= '2012-10-01' AND `date` <= '2012-10-31'
GROUP BY irl.rid