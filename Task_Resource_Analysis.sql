-- =============================================
-- Project: Task Resource and Lifecycle Analysis
-- Description:
-- Retrieves task lifecycle data including assignment,
-- timing (logged, started, finished), and resource usage.
-- Sensitive contract identifiers have been anonymised.
-- =============================================

-- Parameter for contract filtering (anonymised for GitHub)
DECLARE @Contract VARCHAR(50) = 'XXXX';

select

b.BG_USER_DEF3 as 'Contract',
a.TA_TASK_ID as 'Task ID',
a.TA_TASK_DESC as 'Task Type',
a.TA_STATUS as 'Task Status',
concat(convert(varchar(10),a.[TA_DUE_DATE],103),' ',convert(varchar(5),a.[TA_DUE_DATE],108)) as 'Logged Date',
concat(convert(varchar(10),h.[TaskPerfAttendDate],103),' ',convert(varchar(5),h.[TaskPerfAttendDate],108)) as 'Started Date',
concat(convert(varchar(10),a.[TA_FINISH_DATE],103),' ',convert(varchar(5),a.[TA_FINISH_DATE],108)) as 'Finished Date',
concat(convert(varchar(10),a.[TA_EST_DATE],103),' ',convert(varchar(5),a.[TA_EST_DATE],108)) as 'Task Due Date',
b.BG_SITE as 'Building',
a.TA_SHORT_DESC as 'Problem',
a.TA_LONG_DESC as 'Task Description',
a.TA_PRIORITY as 'Task Priority',
e.RES_NAME as 'Resource',
case when e.RES_EXTERNAL = '1' then 'YES' else 'NO' end as 'External Resource'


from F_TASKS a

left outer join FLOCATE b with (nolock) on a.TA_FKEY_BG_SEQ=b.BG_SEQ
left outer join F_CONTRACT_GROUP d with (nolock) on a.TA_FKEY_CTR_SEQ=d.GRP_SEQ
left outer join SLA_TASK_PERFORMANCE h with (nolock) on a.TA_SEQ=h.TASKPERF_TA_SEQ

LEFT OUTER JOIN (
    SELECT c.TT_FKEY_RES_SEQ,
           c.TT_FKEY_TA_SEQ,
		   c.CreatedDate,
           ROW_NUMBER() OVER (PARTITION BY c.TT_FKEY_TA_SEQ ORDER BY c.CreatedDate DESC) AS ct
    FROM F_TASK_TIME c
) cr ON a.TA_SEQ = cr.TT_FKEY_TA_SEQ AND cr.ct = 1

left outer join F_RESOURCE e with (nolock) on cr.TT_FKEY_RES_SEQ=e.RES_SEQ

where
b.BG_USER_DEF3 = @Contract

