CREATE VIEW invoicely_invoices_export AS

SELECT 
 c.`name` as "Company",
 i.invoice_number as "Invoice #",
 i.date_issued as "Date Issued",
 i.date_paid as "Date Paid",
 i.amount_charged as "Charged",
 i.amount_paid as "Paid",
 i.paid as "Has been paid?",
 i.notes as "Notes"
FROM invoicely_invoices i
JOIN invoicely_companies c
  ON c.cid = i.cid
WHERE i.deleted = "No"
ORDER BY i.date_issued