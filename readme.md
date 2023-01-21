I have a product table called [F0004].[dbo].[Prod]

From the Prod table I select ProdNo, Descr, ProdPrGr

I need help to write a SQL query which picks the following data from some other tables:

Pick newest price:
The table called [F0004].[dbo].[PrDcMat] contains prices. From this table I want to pick CstPr, PurcPr, SalePr and FrDt. This table contains multiple records with the same ProdNo. I just want to pick the newest price based on FromDate (SELECT MAX FrDt). If the ProdNo does NOT exist in the PrDcMat-table I want to return DBnull or 0 in the fields (CstPr, PurchPr, SalePr and FrDt).

Pick turnover per product:
The table called [F0004].[dbo].[OrdLn] contains order lines. From this table i want to pick SUM([F0004].[dbo].[OrdLn].[Am]) per product.

Pick stock date and stock count:
The table called [F0004].[dbo].[StcBal] contains stock transactions. From this table I want to pick [F0004].[dbo].[StcBal].[PrvCntDt] and [F0004].[dbo].[StcBal].[PrvCntNo]. This table only contains one record per product.

ProdNo should be the primary key for relating all tables together.