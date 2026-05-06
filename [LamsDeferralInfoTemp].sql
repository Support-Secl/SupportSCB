INSERT INTO [CBRM].[dbo].[LamsDeferralInfo] (
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
    L.[lonFacilityNo],
    DEF.[defDeferralCode],
	DEF.defName,
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
		
	LEFT JOIN IDTP_Report.[dbo].[tbl_App_Loan] L ON L.[lonLLID] = DEF.[defLLID]

	--select *	FROM
 --   IDTP_Report.[dbo].[tbl_App_DeferralTracker] DEF