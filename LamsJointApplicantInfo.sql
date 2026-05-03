INSERT INTO [CBRM].[dbo].[LamsJointApplicantInfo] (
    [relNo],
    [llid],
    [TitleLJ],
    [NameLJ],
    [FatherTitleLJ],
    [FatherNameLJ],
    [MotherTitleLJ],
    [MotherNameLJ],
    [SpouseTitleLJ],
    [SpouseNameLJ],
    [GenderLJ],
    [DateOfBirthLJ],
    [CountryOfBirthLJ],
    [PlaceOfBirthLJ],
    [PermanentAddressLJ],
    [PerPostalCodeLJ],
    [PermanentCountryLJ],
    [PermanentDistrictLJ],
    [PresentAddressLJ],
    [PrePostalCodeLJ],
    [PresentCountryLJ],
    [PresentDistrictLJ],
    [TINLJ],
    [ETINLJ],
    [ContactNoLJ],
    [NIDLJ],
    [smartCardLJ],
    [StatusLJ],
    [tabStatus],
    [rowId],
    [status],
    [actionStatus],
    [subCodeLJ],
    [maritalStatusLJ]
)
SELECT
    NULL,
    LA.[lapLLID],
    AP.[aplTitle],
    AP.[aplName],
    AP.[aplFatherTitle],
    AP.[aplFatherName],
    AP.[aplMotherTitle],
    AP.[aplMotherName],
    AP.[aplSpouseTitle],
    AP.[aplSpouseName],
    CASE AP.[aplGender] WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' ELSE NULL END,
    CONVERT(varchar, AP.[aplDateOfBirth], 23),
    COB.[cntCode],
    POB.[dstName],
    AP.[aplResAddress],
    AP.[aplResPostalCode],
    COB.[cntCode],
    RESD.[dstName],
    AP.[aplOfficeAddress],
    NULL,
    NULL,
    NULL,
    AP.[aplTin],
    AP.[apleTin],
    PH.[lcnNo],
    AP.[aplNationalID],
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    CASE AP.[aplMaritalStatus] WHEN 'M' THEN 'Married' WHEN 'S' THEN 'Single' ELSE NULL END
FROM
    IDTP_Report.[dbo].[tbl_App_LoanApplication] LA
    LEFT JOIN IDTP_Report.[dbo].[tbl_App_LoanApplicationApplicantMap] AM ON LA.[lapLLID] = AM.[lamLoanApplication]
    LEFT JOIN IDTP_Report.[dbo].[tbl_App_Applicant] AP ON AM.[lamApplicant] = AP.[aplCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_District] POB ON AP.[aplPlaceOfBirth] = POB.[dstCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_Country] COB ON AP.[aplCountryOfBirth] = COB.[cntCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_District] RESD ON AP.[aplResDistrict] = RESD.[dstCode]
    -- Phone number: pick the first phone record for this applicant
    LEFT JOIN IDTP_Report.[dbo].[tbl_App_ApplicantPhone] PH 
        ON AP.[aplCode] = PH.[lcnApplicant] 
        AND PH.[lcnCode] = (
            SELECT TOP 1 [lcnCode] 
            FROM IDTP_Report.[dbo].[tbl_App_ApplicantPhone] 
            WHERE [lcnApplicant] = AP.[aplCode] 
            ORDER BY [lcnCode]
        )
WHERE
    LA.[lapLLID] = '1019555'               -- <--- change or remove as needed
    AND AP.[aplCode] IS NOT NULL
    AND LA.[lapIsJointApplicant] = 1;      -- only if flagged as joint