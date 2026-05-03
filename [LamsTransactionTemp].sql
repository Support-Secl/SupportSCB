INSERT INTO [CBRM].[dbo].[LamsTransactionTemp] (
    [llid],
    [disDate],
    [accountType],
    [transAccNo],
    [trAmount],
    [transDrCr],
    [countTrans],
    [status],
    [createdBy],
    [createdOn],
    [flag],
    [rowId],
    [actionStatus]
)
SELECT
    LA.[lapLLID],
    CONVERT(varchar, DIS.[disDisburseDate], 103),
    --TRN.trnType,
	CASE 
		
		WHEN TRN.trnType = 'Collection A/C' 
			THEN 'COLLECTION A/C'
		WHEN TRN.trnType = 'Customer A/C' 
			THEN 'TRANSACTION A/C'
		WHEN TRN.trnType = 'Loan A/C' 
			THEN 'LOAN A/C:'
		WHEN TRN.trnType = 'Pay Order A/C' 
			THEN 'PO AC'

    ELSE TRN.trnType END AS trnType,

    TRN.trnReffNo, --TRN.[trnAccount],
    CONVERT(varchar, TRN.[trnAmount]),
    TRN.[trnDebitCredit],
    NULL,
    15,
    TRN.[trnDisbursement],
    GETDATE(),
    'dis',
    newId(),
    NULL
FROM
    IDTP_Report.[dbo].[tbl_App_LoanApplication] LA
    LEFT JOIN IDTP_Report.[dbo].[tbl_Dis_Disbursement] DIS ON LA.[lapLLID] = DIS.[disLLID]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Dis_Transaction] TRN ON DIS.[disNo] = TRN.[trnDisbursement]
WHERE
    TRN.[trnCode] IS NOT NULL
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



--Collection A/C
--Customer A/C
--Loan A/C
--Pay Order A/C

