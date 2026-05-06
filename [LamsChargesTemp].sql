INSERT INTO [CBRM].[dbo].[LamsCharges] (
    [llid],
    [disDate],
    [chargeType],
    [chargeAccNo],
    [crAmount],
    [chargeDrCr],
    [createdBy],
    [createdOn],
    [status],
    [flag],
    [rowId],
    [actionStatus]
)
SELECT
    LA.[lapLLID],
    CONVERT(varchar, DIS.[disDisburseDate], 103),
   -- CHGT.[chtType],
	CASE

		WHEN CHGT.[chtType] = 'Stamp Charge'
			 AND SRC.[srcName] IN (
				'AGRABAD',
				'AUTO SALES CHITTAGONG',
				'CHITTAGONG MAIN',
				'CHITTAGONG PRIORITY BANKING',
				'CHITTAGONG SALES OFFICE',
				'CREDIT & COLLECTION UNIT - CHITTAGONG',
				'NASIRABAD',
				'NASIRABAD PRIORITY BANKING',
				'PECA # 08',
				'PECA # 09',
				'PECA # CHITTAGONG'
			 )
		THEN 'STAMP-CTG'

		WHEN CHGT.[chtType] = 'Stamp Charge'
		THEN 'STAMP-DHK'

		WHEN CHGT.[chtType] = 'BIL OD Commission'
			 AND LEFT(L.[lonLoanAccNo], 2) = '06'
		THEN 'BIL PROCESSING FEE - EBBS'

		WHEN CHGT.[chtType] = 'BIL OD Commission'
			 AND LEFT(L.[lonLoanAccNo], 2) <> '06'
		THEN 'BIL PROCESSING FEE & VAT - RLS'

		WHEN CHGT.[chtType] IN (
			'Commission',
			'LAP OD Commission',
			'OD Commission',
			'Processing Fee'
		)
		AND LEFT(L.[lonLoanAccNo], 2) = '06'
		THEN 'BIL PROCESSING FEE - EBBS'

		WHEN CHGT.[chtType] IN (
			'Commission',
			'LAP OD Commission',
			'OD Commission',
			'Processing Fee'
		)
		AND LEFT(L.[lonLoanAccNo], 2) <> '06'
		THEN 'BIL PROCESSING FEE & VAT - RLS'

		WHEN CHGT.[chtType] = 'Notarization'
		THEN 'NOTARIZATION FEES A/C A-LOAN ASSETS OPS DHK'

		WHEN CHGT.[chtType] = 'Fees'
		THEN 'PROCESSING FEE / COMMISSION:'

		-- VAT < 100 => CIB CHARGE (but keep NULL as NULL)
		WHEN CHGT.[chtType] LIKE 'VAT%'
			 AND CHG.[chrAmount] IS NOT NULL
			 AND CHG.[chrAmount] < 100
		THEN 'CIB CHARGE'

		-- VAT > 100 => category mapping (but keep NULL as NULL)
		WHEN CHGT.[chtType] LIKE 'VAT%'
			 AND CHG.[chrAmount] IS NOT NULL
			 AND CHG.[chrAmount] > 100
		THEN 
			CASE PCAT.[pctCategory]
				WHEN 'Auto' THEN 'PROCESSING FEE / COMMISSION:'
				WHEN 'PL' THEN 'VAT AT SOURCE FEES & COMM'
				WHEN 'Cash Line' THEN 'PROCESSING FEE'
				WHEN 'SME' THEN 'BIL PROCESSING FEE - EBBS'
				WHEN 'Mortgage' THEN 'MORTGAGE PROCESSING FEE'
				ELSE CHGT.[chtType]
			END

		ELSE CHGT.[chtType]

	END AS chtType,
    CHGT.chtAccount,
    CONVERT(varchar, CHG.[chrAmount]),
    NULL,
    CHG.[chrDisbursement],
    GETDATE(),
    15,
    'dis',
    newId(),
    NULL
FROM
    IDTP_Report.[dbo].[tbl_App_LoanApplication] LA
	LEFT JOIN IDTP_Report.[dbo].[tbl_App_Loan] L ON LA.[lapLLID] = L.[lonLLID]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Dis_Disbursement] DIS ON LA.[lapLLID] = DIS.[disLLID]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Dis_ChargeDetails] CHG ON DIS.[disNo] = CHG.[chrDisbursement]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_ChargeType] CHGT ON CHG.[chrType] = CHGT.[chtCode]
	LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_Product] PROD ON LA.[lapProduct] = PROD.[proCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_ProductCategory] PCAT ON PROD.[proProductCategory] = PCAT.[pctCode]
	LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_Source] SRC ON LA.[lapSource] = SRC.[srcCode]

	WHERE 
		LA.lapLLID='1131816'

	--	select * from [LamsChargesTemp] where llid='1019555'

