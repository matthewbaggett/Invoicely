DROP FUNCTION IF EXISTS get_financial_year();

CREATE FUNCTION get_financial_year (date_given DATETIME)
RETURNS VARCHAR(9)
AS '
		CASE 
			WHEN MONTH(date_given)>=4 THEN
			  RETURN concat(YEAR(date_given), "-", YEAR(date_given)+1);
		  ELSE
			  RETURN concat(YEAR(date_given)-1, "-", YEAR(date_given));
		END CASE;
  '