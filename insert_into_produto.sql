USE DB211708020

INSERT INTO [DW211708020].[dbo].[produto]

SELECT NEWID(), * FROM(
	SELECT productid, productname, productprice, categoryname, vendorname
	FROM s_product p
	INNER JOIN s_category c
	ON p.categoryid = c.categoryid
	INNER JOIN s_vendor v
	ON p.vendorid = v.vendorid) AS a