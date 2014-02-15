CREATE VIEW invoicely_receipts_export AS

SELECT 
  r.rid as "Reciept #",
  r.`date` as "Date",
  c.`name` as "Company",
  sum(l.amount) as "Amount",
  count(l.rlid) as "Items in receipt"

FROM invoicely_receipts r
JOIN invoicely_companies c
  ON c.cid = r.cid
JOIN invoicely_receipt_lines l
  ON l.rid = r.rid
WHERE r.deleted = "No"
GROUP BY r.rid
ORDER BY r.`date` ASC
