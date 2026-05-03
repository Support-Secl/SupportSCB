INSERT INTO [CBRM].[dbo].[LamsChargesTemp] (
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
	L.[lonLoanAccNo],
    CHGT.[chtType],
	CASE
		/* =========================
		   1. STAMP CHARGE RULE
		   ========================= */
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


		/* =========================
		   2. BIL OD COMMISSION RULE
		   ========================= */
		WHEN CHGT.[chtType] = 'BIL OD Commission'
			 AND LEFT(L.[lonLoanAccNo], 2) = '06'
		THEN 'BIL PROCESSING FEE - EBBS'

		WHEN CHGT.[chtType] = 'BIL OD Commission'
			 AND LEFT(L.[lonLoanAccNo], 2) <> '06'
		THEN 'BIL PROCESSING FEE & VAT - RLS'


		/* =========================
		   3. GROUPED COMMISSION RULE
		   ========================= */
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


		/* =========================
		   4. DEFAULT
		   ========================= */
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
    CHG.[chrCode] IS NOT NULL
		AND LA.lapLLID IN (
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

	--	select * from [LamsChargesTemp] where llid='1019555'

