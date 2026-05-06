INSERT INTO [CBRM].[dbo].[LamsBusinessInfo] (
    [relNo],
    [llid],
    [legalEntityofBusiness],
    [registrationID],
    [registrationDate],
    [eTINNo],
    [businessAddress],
    [businessDistrict],
    [postalCode],
    [country],
    [contactNumber],
    [sectorType],
    [sectorCode],
    [mailingAddress],
    [subCodeLB],
    [tabStatus],
    [rowId],
    [status],
    [tradeName],
    [actionStatus]
)
SELECT
    NULL,
    LA.[lapLLID],
   -- COM.[comLegalEntityOfBusiness],
	CASE COM.[comLegalEntityOfBusiness] WHEN 'Properiertorship' THEN 'Proprietorship' ELSE COM.[comLegalEntityOfBusiness] END AS [comLegalEntityOfBusiness],--  Proprietorship in cbrm /  Properiertorship
    NULL,
    NULL,
    COALESCE(COM.[comeTin],COM.[comTin]) AS Tin,   -- new have only etin()cometin=== comtin vs come tin
    COM.[comBusinessAddress],
    BDIST.[dstName],
    COM.[comBusinessPostalCode],
    BCNT.[cntCode],
    COM.[comPhoneNo],
	CASE COM.[comSectorType] WHEN '9' THEN 'Private' WHEN '1' THEN 'Public' ELSE NULL END,
    CONVERT(varchar, COM.[comSectorCode]),
    COM.[comMailingAddress],
    NULL,
    NULL,
    newId(),
    15,
    COM.[comTradeName],
    NULL
FROM
    IDTP_Report.[dbo].[tbl_App_LoanApplication] LA
    LEFT JOIN IDTP_Report.[dbo].[tbl_App_LoanApplicationCompanyMap] CM ON LA.[lapLLID] = CM.[lcmLoanApplication]
    LEFT JOIN IDTP_Report.[dbo].[tbl_App_Company] COM ON CM.[lcmCompany] = COM.[comCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_District] BDIST ON COM.[comBusinessDistrict] = BDIST.[dstCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_Country] BCNT ON COM.[comBusinessCountry] = BCNT.[cntCode]
WHERE

  
    COM.[comCode] IS NOT NULL;

	--select * from tbl_App_Company where 