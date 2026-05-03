INSERT INTO [CBRM].[dbo].[LamsSecurityInfoTemp] (
    [relNo],
    [llid],
    [holderName],
    [securityType],
    [serialNumber],
    [registrationNumber],
    [denomination],
    [noOfLeaf],
    [totalAmount],
    [encashmentAccount],
    [encashmentAmount],
    [encashlimitInWords],
    [dateofIssue],
    [dateofMaturity],
    [issuingOffice],
    [propertySchedule],
    [remarksLs],
    [tabStatus],
    [rowId],
    [status],
    [totalAmountInWords],
    [actionStatus]
)
SELECT
    NULL,
    L.[lonLLID],
    SEC.[lscSecuHolderName],
    ST.[stpType],
    SEC.[lscSerialFDRNo],
    SEC.[lscIDNo],
    CONVERT(varchar, SEC.[lscDenomination]),
    CONVERT(varchar, SEC.[lscNoOfLeaf]),
    CONVERT(varchar, SEC.[lscTotalAmount]),
    NULL,
    NULL,
    NULL,
    CONVERT(varchar, SEC.[lscDateofIssue], 23),
    CONVERT(varchar, SEC.[lscDateofMaturity], 23),
    SEC.[lscIssuingOffice],
    SEC.[lscPropertySchedule],
    NULL,
    NULL,
    newId(),
    15,
    NULL,
    NULL
FROM
    IDTP_Report.[dbo].[tbl_App_Loan] L
    LEFT JOIN IDTP_Report.[dbo].[tbl_App_LoanSecurity] SEC ON L.[lonLLID] = SEC.[lscLoan]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_SecurityType] ST ON SEC.[lscSecurityType] = ST.[stpCode]
WHERE
    SEC.[lscCode] IS NOT NULL
		AND L.[lonLLID] IN (
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