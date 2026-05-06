INSERT INTO [CBRM].[dbo].[LamsTopLevelInfo] (
    [llid],
    [loanAccountNo],
    [productType],
    [subProductType],
    [loanCategory],
    [productCategory],
    [productCode],
    [salesPerson],
    [salesChannel],
    [lastModifiedDate],
    [createdBy],
    [approvedBy],
    [approvedDate],
    [checkerRemarks],
    [makerRemarks],
    [rowId],
    [masterNo],
    [appliedAmount],
    [closingStatus],
    [status],
    [actionStatus]
)
SELECT
    LA.[lapLLID],
    L.[lonLoanAccNo],
    PCAT.[pctCategory],
  --  PROD.[proName],
	CASE 

	 -- Personal / Staff

	WHEN PROD.proName IN ('Credit Card', 'Flexi Loan') 
        THEN 'Business Overdraft'

    WHEN PROD.proName =  'Staff Personal Loan'
        THEN 'Staff Loan'

    WHEN PROD.proName =  'Islamic Personal Finance'
        THEN 'Saadiq Personal Finance'

    WHEN PROD.proName = 'Staff Festi Loan'
        THEN 'Staff Festival Loan' 

    -- Auto
    WHEN PROD.proName = 'Islamic Auto Finance'
        THEN 'Saadiq Auto Finance' 

    WHEN PROD.proName =  'Staff Auto Loan'
        THEN 'Staff Auto'

    -- Mortgage
       WHEN PROD.proName = 'Staff Mortgage' 
        THEN 'STAFF'

    WHEN PROD.proName = 'MORTGAGEONE ACCOUNT' 
        THEN 'MortgageOne Account'

    -- Cash Line
    WHEN PROD.proName = 'CLF'
        THEN 'Cash Line Fixed'

	WHEN PROD.proName = 'CL'
        THEN 'Cash Line OD'

    -- SME
    WHEN PROD.proName IN ('Over Draft', 'BIL-OD') 
        THEN 'Business Overdraft'

    WHEN PROD.proName IN ('BIL', 'BIL(105%)', 'BFS-R/L') 
        THEN 'Business Installment Loan'

    WHEN PROD.proName IN ('LAP-Term Loan', 'LAP-OD') 
        THEN 'Loan Against Property'

    WHEN PROD.proName = 'IFAP' 
        THEN 'Saadiq Finance Against Property'

    WHEN PROD.proName = 'SCM' 
        THEN 'Saadiq Commercial Mortgage'

    WHEN PROD.proName = 'IBIF' 
        THEN 'Saadiq Business Instal Finance'

    ELSE PROD.[proName] END AS [proName],
   -- LCAT.[lcaName],
	CASE
		WHEN LCAT.[lcaName] ='Top Up'
		AND LEFT(L.[lonLoanAccNo], 2) = '06'
		THEN 'Top Up Loan EBBS'
		WHEN LCAT.[lcaName] ='Top Up'
		AND LEFT(L.[lonLoanAccNo], 2) <> '06'
		THEN 'Top Up Loan RLS'
	
	ELSE LCAT.[lcaName] END,
    PCAT.[pctCategory],
    PROD.[proCode],
    LA.[lapSalesPersonName],
    SRC.[srcName],
    GETDATE(),
    LA.[lapMakerID],
    LA.[lapCheckerID],
    LA.[lapCheckDate],
    LA.[lapRemarks],
    LA.[lapStatusUpdateRemarks],
    newId(),
    L.[lonMasterNo],
    CONVERT(varchar, LA.[lapAppliedAmount]),
    NULL,
    15,
    NULL

FROM
    IDTP_Report.[dbo].[tbl_App_LoanApplication] LA
    LEFT JOIN IDTP_Report.[dbo].[tbl_App_Loan] L ON LA.[lapLLID] = L.[lonLLID]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_Product] PROD ON LA.[lapProduct] = PROD.[proCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_ProductCategory] PCAT ON PROD.[proProductCategory] = PCAT.[pctCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_Source] SRC ON LA.[lapSource] = SRC.[srcCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_LoanCategory] LCAT ON L.[lonCategory] = LCAT.[lcaCode]
WHERE
    LA.[lapLLID] IS NOT NULL   -- adjust filter as needed
