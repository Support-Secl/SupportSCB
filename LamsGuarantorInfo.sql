INSERT INTO [CBRM].[dbo].[LamsGuarantorInfoTemp] (
    [relNo],
    [llid],
    [TitleLG],
    [NameLG],
    [FatherTitleLG],
    [FatherNameLG],
    [MotherTitleLG],
    [MotherNameLG],
    [SpouseTitleLG],
    [SpouseNameLG],
    [GenderLG],
    [DateOfBirthLG],
    [CountryOfBirthLG],
    [PlaceOfBirthLG],
    [PermanentAddressLG],
    [PerPostalCodeLG],
    [PermanentCountryLG],
    [PermanentDistrictLG],
    [PresentAddressLG],
    [PrePostalCodeLG],
    [PresentCountryLG],
    [PresentDistrictLG],
    [TINLG],
    [ETINLG],
    [ContactNoLG],
    [NIDLG],
    [smartCardLG],
    [StatusLG],
    [guarantorAmountLG],
    [rowId],
    [status],
    [actionStatus],
    [subCodeLG],
    [maritalStatusLG]
)
SELECT
    CASE 
        WHEN PATINDEX('%[0-9]%', G.gntName) > 0 
            THEN LEFT(
                    SUBSTRING(G.gntName, PATINDEX('%[0-9]%', G.gntName), LEN(G.gntName)),
                    PATINDEX('%[^0-9]%', 
                        SUBSTRING(G.gntName, PATINDEX('%[0-9]%', G.gntName), LEN(G.gntName)) + 'X'
                    ) - 1
                 )
        ELSE NULL
    END AS relNo,                           -- relNo
    G.[gntLLID],                            -- llid
    NULL,                                   -- TitleLG (not available)
    G.[gntName],                            -- NameLG
    NULL,                                   -- FatherTitleLG
    G.[gntFatherName],                      -- FatherNameLG
    NULL,                                   -- MotherTitleLG
    G.[gntSpouseName],                      -- MotherNameLG (spouse used as mother – adjust if needed)
    NULL,                                   -- SpouseTitleLG
    G.[gntSpouseName],                      -- SpouseNameLG
    NULL,                                   -- GenderLG
    NULL,                                   -- DateOfBirthLG
    NULL,                                   -- CountryOfBirthLG
    NULL,                                   -- PlaceOfBirthLG
    G.[gntResidenseAddress],                 -- PermanentAddressLG
    NULL,                                   -- PerPostalCodeLG
    NULL,                                   -- PermanentCountryLG
    NULL,                                   -- PermanentDistrictLG
    G.[gntBusinessAddress],                  -- PresentAddressLG
    NULL,                                   -- PrePostalCodeLG
    NULL,                                   -- PresentCountryLG
    NULL,                                   -- PresentDistrictLG
    NULL,                                   -- TINLG
    NULL,                                   -- ETINLG
    COALESCE(G.[gntPhoneNo], G.[gntCellNo]), -- ContactNoLG (prefer phone, fallback to cell)
    NULL,                                   -- NIDLG
    NULL,                                   -- smartCardLG
    NULL,                                   -- StatusLG
    CONVERT(varchar, G.[gntAmount]),         -- guarantorAmountLG
    newId(),                                   -- rowId
    15,                                   -- status
    NULL,                                   -- actionStatus
    NULL,                                   -- subCodeLG
    NULL                                    -- maritalStatusLG
FROM
    IDTP_Report.[dbo].[tbl_App_Guarantor] G
WHERE
    G.[gntLLID] = '1091893';   -- <--- change or remove as needed

	--select * from [tbl_App_Guarantor]