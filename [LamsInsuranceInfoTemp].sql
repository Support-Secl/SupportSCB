INSERT INTO [CBRM].[dbo].[LamsInsuranceInfoTemp] (
    [relNo],
    [llid],
    [insType],
    [incCompany],
    [polNumber],
    [resaddress],
    [expDate],
    [riskCover],
    [amount],
    [tabStatus],
    [rowId],
    [status],
    [actionStatus]
)
SELECT
    NULL,
    L.[lonLLID],
   -- INS.[insType],
	CASE INS.[insType] WHEN 'GI' THEN 'General insurance' WHEN 'LI' THEN 'Life Insurance' ELSE NULL END,
    INSC.[comName],
    INS.[insPolicyNumber],
    INS.[insAddress],
    CONVERT(varchar, INS.[insExpiry], 103),
    PK.[pklText],
    CONVERT(varchar, INS.[insAmount]),
    NULL,
    newId(),
    15,
    NULL
FROM
    IDTP_Report.[dbo].[tbl_App_Loan] L
    LEFT JOIN IDTP_Report.[dbo].[tbl_Lon_Insurance] INS ON L.[lonLLID] = INS.[insLoan]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_InsuranceCompany] INSC ON INS.[insCompany] = INSC.[comCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_PickList] PK ON INS.[insRiskCover] = PK.[pklCode]
WHERE
    INS.[insCode] IS NOT NULL

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