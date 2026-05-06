update c  set
  
    c.[disType]=L.[lonReferralCode]

	
	
FROM

	[CBRM].[dbo].[LamsDisbursInfo] c

    INNER JOIN IDTP_Report.[dbo].[tbl_App_LoanApplication] LA ON c.llid=LA.lapLLID
    LEFT JOIN IDTP_Report.[dbo].[tbl_App_Loan] L ON LA.[lapLLID] = L.[lonLLID]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Dis_Disbursement] DIS ON LA.[lapLLID] = DIS.[disLLID]
	LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_Product] PROD ON LA.[lapProduct] = PROD.[proCode]
	LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_ProductCategory] PCAT ON PROD.[proProductCategory] = PCAT.[pctCode]
	OUTER APPLY (
		SELECT TOP 1 T.trnPONumber
		FROM IDTP_Report.[dbo].[tbl_Dis_Transaction] T
		WHERE T.trnDisbursement = DIS.disNo
		  AND T.trnPONumber IS NOT NULL
	) TRN

WHERE
     PCAT.[pctCategory]='Mortgage'

