DECLARE @LLID VARCHAR(20) = '1019555';

WITH LON AS
(
    SELECT lonLLID
    FROM dbo.tbl_App_Loan
    WHERE lonLLID = @LLID
),
DIS AS
(
    SELECT disNo
    FROM dbo.tbl_Dis_Disbursement
    WHERE disLLID = @LLID
)

SELECT *
FROM (
SELECT 1 AS Sl,'tbl_App_LoanApplication' AS TableName, COUNT(*) AS Cnt
FROM dbo.tbl_App_LoanApplication
WHERE lapLLID = @LLID

UNION ALL
SELECT 2,'tbl_App_LoanApplicationApplicantMap', COUNT(*)
FROM dbo.tbl_App_LoanApplicationApplicantMap
WHERE lamLoanApplication = @LLID

UNION ALL
SELECT 3,'tbl_App_Applicant', COUNT(*)
FROM dbo.tbl_App_Applicant
WHERE aplCode IN (
    SELECT lamApplicant
    FROM dbo.tbl_App_LoanApplicationApplicantMap
    WHERE lamLoanApplication = @LLID)

UNION ALL
SELECT 4,'tbl_App_Guarantor', COUNT(*)
FROM dbo.tbl_App_Guarantor
WHERE gntLLID = @LLID

UNION ALL
SELECT 5,'tbl_App_Loan', COUNT(*)
FROM dbo.tbl_App_Loan
WHERE lonLLID = @LLID

UNION ALL
SELECT 6,'tbl_Lon_PersonalLoan', COUNT(*)
FROM dbo.tbl_Lon_PersonalLoan
WHERE prlLoanLLID = @LLID

UNION ALL
SELECT 7,'tbl_Lon_AutoLoan', COUNT(*)
FROM dbo.tbl_Lon_AutoLoan
WHERE atlLoanLLID = @LLID

UNION ALL
SELECT 8,'tbl_Lon_SMELoan', COUNT(*)
FROM dbo.tbl_Lon_SMELoan
WHERE smlLoanLLID = @LLID

UNION ALL
SELECT 9,'tbl_Lon_MortgageLoan', COUNT(*)
FROM dbo.tbl_Lon_MortgageLoan
WHERE mglLoanLLID = @LLID

UNION ALL
SELECT 10,'tbl_Lon_CashLineLoan', COUNT(*)
FROM dbo.tbl_Lon_CashLineLoan
WHERE cllLoanLLID = @LLID

UNION ALL
SELECT 11,'tbl_Dis_Disbursement', COUNT(*)
FROM dbo.tbl_Dis_Disbursement
WHERE disLLID = @LLID

UNION ALL
SELECT 12,'tbl_Dis_ChargeDetails', COUNT(*)
FROM dbo.tbl_Dis_ChargeDetails
WHERE chrDisbursement IN (SELECT disNo FROM DIS)

UNION ALL
SELECT 13,'tbl_Dis_Transaction', COUNT(*)
FROM dbo.tbl_Dis_Transaction
WHERE trnDisbursement IN (SELECT disNo FROM DIS)

UNION ALL
SELECT 14,'tbl_App_Basel', COUNT(*)
FROM dbo.tbl_App_Basel
WHERE bslLoanApplication = @LLID

UNION ALL
SELECT 15,'tbl_App_DeferralTracker', COUNT(*)
FROM dbo.tbl_App_DeferralTracker
WHERE defLLID = @LLID

UNION ALL
SELECT 16,'tbl_App_LoanSecurity', COUNT(*)
FROM dbo.tbl_App_LoanSecurity
WHERE lscLoan IN (SELECT lonLLID FROM LON)

UNION ALL
SELECT 17,'tbl_Lon_Insurance', COUNT(*)
FROM dbo.tbl_Lon_Insurance
WHERE insLoan = @LLID

UNION ALL
SELECT 18,'tbl_App_LoanClose', COUNT(*)
FROM dbo.tbl_App_LoanClose
WHERE lclLoan = @LLID

UNION ALL
SELECT 19,'tbl_App_LoanApplicationCompanyMap', COUNT(*)
FROM dbo.tbl_App_LoanApplicationCompanyMap
WHERE lcmLoanApplication = @LLID

UNION ALL
SELECT 20,'tbl_App_Company', COUNT(*)
FROM dbo.tbl_App_Company
WHERE comCode IN (
    SELECT lcmCompany
    FROM dbo.tbl_App_LoanApplicationCompanyMap
    WHERE lcmLoanApplication = @LLID
)

UNION ALL
SELECT 21,'tbl_App_CompanyOwnerMap', COUNT(*)
FROM dbo.tbl_App_CompanyOwnerMap
WHERE cmoCompany IN (
    SELECT comCode
    FROM dbo.tbl_App_Company
    WHERE comCode IN (
        SELECT lcmCompany
        FROM dbo.tbl_App_LoanApplicationCompanyMap
        WHERE lcmLoanApplication = @LLID
    )
)

UNION ALL
SELECT 22,'tbl_App_Applicant (Owner)', COUNT(*)
FROM dbo.tbl_App_Applicant
WHERE aplCode IN (
    SELECT cmoApplicant
    FROM dbo.tbl_App_CompanyOwnerMap
    WHERE cmoCompany IN (
        SELECT comCode
        FROM dbo.tbl_App_Company
        WHERE comCode IN (
            SELECT lcmCompany
            FROM dbo.tbl_App_LoanApplicationCompanyMap
            WHERE lcmLoanApplication = @LLID
        )
    )
)

UNION ALL
SELECT 23,'tbl_Lon_LoanDocument', COUNT(*)
FROM dbo.tbl_Lon_LoanDocument
WHERE ldtLoan = @LLID

UNION ALL
SELECT 24,'tbl_App_Document', COUNT(*)
FROM dbo.tbl_App_Document
WHERE ldcCode IN (
    SELECT ldtDocument
    FROM dbo.tbl_Lon_LoanDocument
    WHERE ldtLoan = @LLID
)

) A
ORDER BY Sl;

--=================================================
--= apllicant company count
SELECT 
    AP.aplCode,
    AP.aplName
FROM dbo.tbl_App_LoanApplicationCompanyMap CM

INNER JOIN dbo.tbl_App_CompanyOwnerMap OWM
        ON CM.lcmCompany = OWM.cmoCompany

INNER JOIN dbo.tbl_App_Applicant AP
        ON OWM.cmoApplicant = AP.aplCode

WHERE CM.lcmLoanApplication = '1019555';
--------====================================
