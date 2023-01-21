# CASE 1 - PICK NEWEST PRICE

SELECT PRD.ProdNo, PRD.Descr, PRD.ProdPrGr, PrDcMat.*
FROM  [F0004].[dbo].[Prod] PRD
OUTER APPLY(
SELECT TOP 1 CstPr, PurchPr, SalePr and FrDt
FROM [F0004].[dbo].[PrDcMat] PRC
WHERE PRC.ProdNo = PRD.ProdNo
ORDER BY FrDt DESC
) PrDcMat

# CASE 2 - PICK TURNOVER PER PRODUCT
SELECT PRD.ProdNo, PRD.Descr, PRD.ProdPrGr, OL_SUM.SUM_AM
FROM  [F0004].[dbo].[Prod] PRD
LEFT JOIN
(SELECT OL.ProdNo, SUM(OL.Am) SUM_AM
FROM [F0004].[dbo].[OrdLn] OL
GROUP BY ProdNo
) OL_SUM
ON OL_SUM.ProdNo = PRD.ProdNo

# CASE 3 - PICK STOCK DATE AND STOCK COUNT
SELECT PRD.ProdNo, PRD.Descr, PRD.ProdPrGr, BAL.PrvCntDt, BAL.PrvCntNo
FROM  [F0004].[dbo].[Prod] PRD
LEFT JOIN
 [F0004].[dbo].[StcBal] BAL
ON BAL.ProdNo = PRD.ProdNo