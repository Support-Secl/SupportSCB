INSERT INTO [CBRM].[dbo].[LamsApplicantInfo] (
    [relNo],
    [llid],
    [TitleLA],
    [NameLA],
    [FatherTitleLA],
    [FatherNameLA],
    [MotherTitleLA],
    [MotherNameLA],
    [SpouseTitleLA],
    [SpouseNameLA],
    [GenderLA],
    [DateOfBirthLA],
    [CountryOfBirthLA],
    [PlaceOfBirthLA],
    [PermanentAddressLA],
    [PerPostalCodeLA],
    [PermanentCountryLA],
    [PermanentDistrictLA],
    [PresentAddressLA],
    [PrePostalCodeLA],
    [PresentCountryLA],
    [PresentDistrictLA],
    [TINLA],
    [ETINLA],
    [ContactNoLA],
    [NIDLA],
    [smartCardLA],
    [subCodeLA],
    [StatusLA],
    [tabStatus],
    [rowId],
    [status],
    [actionStatus],
    [maritalStatusLA]
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
    COB.[cntName],
    POB.[dstName],
    AP.[aplResAddress],
    AP.[aplResPostalCode],
    COB.[cntName],                        -- assuming permanent country = country of birth
    RESD.[dstName],
    AP.[aplOfficeAddress],
    NULL,
    NULL,
    NULL,
    AP.[aplTin],
    AP.[apleTin],
    PH.[lcnNo],                            -- phone number from the subquery join
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
    [LAMS].[dbo].[tbl_App_LoanApplication] LA
    LEFT JOIN [LAMS].[dbo].[tbl_App_LoanApplicationApplicantMap] AM ON LA.[lapLLID] = AM.[lamLoanApplication]
    LEFT JOIN [LAMS].[dbo].[tbl_App_Applicant] AP ON AM.[lamApplicant] = AP.[aplCode]
    LEFT JOIN [LAMS].[dbo].[tbl_Conf_District] POB ON AP.[aplPlaceOfBirth] = POB.[dstCode]
    LEFT JOIN [LAMS].[dbo].[tbl_Conf_Country] COB ON AP.[aplCountryOfBirth] = COB.[cntCode]
    LEFT JOIN [LAMS].[dbo].[tbl_Conf_District] RESD ON AP.[aplResDistrict] = RESD.[dstCode]
    -- Phone number: pick the first phone record for this applicant
    LEFT JOIN [LAMS].[dbo].[tbl_App_ApplicantPhone] PH 
        ON AP.[aplCode] = PH.[lcnApplicant] 
        AND PH.[lcnCode] = (
            SELECT TOP 1 [lcnCode] 
            FROM [LAMS].[dbo].[tbl_App_ApplicantPhone] 
            WHERE [lcnApplicant] = AP.[aplCode] 
            ORDER BY [lcnCode]
        )
WHERE
    LA.[lapLLID] = '1019555'   -- <--- change or remove as needed
    AND AP.[aplCode] IS NOT NULL;