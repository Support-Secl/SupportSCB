INSERT INTO [CBRM].[dbo].[LamsDeferralInfoTemp] (
    [relNo],
    [llid],
    [facilityNo],
    [docCode],
    [docDef],
    [defStatus],
    [approver],
    [dueDate],
    [receivedDate],
    [remarks],
    [status],
    [rowId],
    [docRecDate],
    [docPenDate],
    [actionStatus],
    [pwid]
)
SELECT
    NULL,
    DEF.[defLLID],
    DEF.[defLoanAccNo],
    NULL,
    DEF.[defDeferralCode],
    DEF.[defStatus],
    DEF.[defApprover],
    CONVERT(varchar, DEF.[defDueDate], 103),
    CONVERT(varchar, DEF.[defReceivedDate], 103),
    DEF.[defRemarks],
    15,
    newId(),
    NULL,
    NULL,
    NULL,
    NULL
FROM
    IDTP_Report.[dbo].[tbl_App_DeferralTracker] DEF
		WHERE  DEF.defLLID IN (
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