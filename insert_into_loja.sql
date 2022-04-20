USE DB211708020

INSERT INTO [DW211708020].[dbo].[loja]

SELECT NEWID(), * FROM( 
	SELECT s.storeid, StoreSize, storezip, CSystem, LayoutDesc, regionname
	FROM s_store s
	LEFT JOIN f_store f
	ON s.storeid = f.StoreID
	LEFT JOIN f_checkoutsystem c
	ON c.CSID = f.CSID
	LEFT JOIN f_layout l
	ON l.LayoutID = f.LayoutID
	INNER JOIN s_region r
	ON r.regionid = s.regionid) AS a