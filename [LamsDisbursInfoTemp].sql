INSERT INTO [CBRM].[dbo].[LamsDisbursInfoTemp] (
    [relNo],
    [llid],
    [nameLA],
    [disDate],
    [disType],
    [remAmount],
    [disAmount],
    [topUpAdj],
    [PONumber],
    [remarks],
    [rowId],
    [loanAccountNo],
    [linkAccNo],
    [banka],
    [bankaRefund],
    [status],
    [netAmount],
    [grossAmount],
    [actionStatus],
    [blockAmount]
)
SELECT
    NULL,
    LA.[lapLLID],
    LA.[lapApplicantName],
    CONVERT(varchar, DIS.[disDisburseDate], 103),
    DIS.[disDisbursementType],
    CONVERT(varchar, DIS.[disRemainigAmount]),
    CONVERT(varchar, DIS.[disDisbursementAmount]),
    CONVERT(varchar, DIS.[disTopUpAdjstAmount]),
    TRN.[trnPONumber],
    L.lonRemarks,
    newId(),
    L.[lonLoanAccNo],
    L.[lonLinkAccNo],
    CONVERT(varchar, L.[lonLastBanca]),
    CONVERT(varchar, L.[lonCalculatedBanca]),
    15,
    NULL,
    NULL,
    NULL,
    NULL
FROM
    IDTP_Report.[dbo].[tbl_App_LoanApplication] LA
    LEFT JOIN IDTP_Report.[dbo].[tbl_App_Loan] L ON LA.[lapLLID] = L.[lonLLID]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Dis_Disbursement] DIS ON LA.[lapLLID] = DIS.[disLLID]
	OUTER APPLY (
		SELECT TOP 1 T.trnPONumber
		FROM IDTP_Report.[dbo].[tbl_Dis_Transaction] T
		WHERE T.trnDisbursement = DIS.disNo
		  AND T.trnPONumber IS NOT NULL
	) TRN

WHERE
    DIS.[disNo] IS NOT NULL
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