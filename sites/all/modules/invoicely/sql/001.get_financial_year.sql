DROP FUNCTION IF EXISTS {get_financial_year};

CREATE FUNCTION {get_financial_year} (date_given DATETIME)
RETURNS VARCHAR(9) DETERMINISTIC
RETURN 
		CASE 
			WHEN MONTH(date_given)>=4 
		THEN
			concat(YEAR(date_given), '-',YEAR(date_given)+1)
		ELSE 
			concat(YEAR(date_given)-1,'-', YEAR(date_given))
		END;
		