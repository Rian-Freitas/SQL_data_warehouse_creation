USE DB211708020

INSERT INTO [DW211708020].[dbo].[cliente]

SELECT NEWID(), * FROM( 
	SELECT customerid, customername, customerzip, gender, marital_status, education, credit_score
	FROM EXTERNAL_CUSTOMERS e
	full JOIN s_customer s
	ON e.customer_id = s.customerid) AS a