USE DB211708020

DECLARE @horarios TABLE (tid CHAR(4) NOT NULL, horario TIME(0) NOT NULL);

INSERT INTO @horarios VALUES
	('T111','14:02:12'),
	('T222','09:54:40'),
	('T333','19:30:43'),
	('T444','21:14:06'),
	('T555','15:22:37'),
	('T666','22:31:53')

INSERT INTO [DW211708020].[dbo].[venda] (tid, key_produto, horario, quantidade, key_calendario, key_loja, key_cliente)

SELECT h.tid, key_produto, horario, quantity, key_calendario, key_loja, key_cliente
FROM @horarios h
INNER JOIN s_includes si
ON h.tid = si.tid
INNER JOIN [DW211708020].[dbo].[produto] dwp
ON dwp.id_produto = si.productid
INNER JOIN s_salestransaction ss
ON ss.tid = si.tid
INNER JOIN [DW211708020].[dbo].[calendario] dwc
ON dwc.data_completa = ss.tdate
INNER JOIN [DW211708020].[dbo].[loja] dwl
ON dwl.id_loja = ss.storeid
INNER JOIN [DW211708020].[dbo].[cliente] dwcl
ON dwcl.id_cliente = ss.customerid