INSERT INTO [CBRM].[dbo].[LamsTopLevelInfoTemp] (
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
    LCAT.[lcaName],
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
	AND LA.[lapLLID] IN (
    '1133523',
    '1135324',
    '1131242',
    '1131222',
    '357781',
    '372209',
    '361993',
    '400726',
    '436532',
    '433297',
    '438190',
    '443826',
    '444794'
);