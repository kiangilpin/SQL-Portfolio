-- =============================================
-- Project: Task Monitoring and SLA Analysis
-- Description:
-- Retrieves task-level data including SLA performance,
-- highlighting overdue tasks and RAG status.
-- Sensitive data has been anonymised.
-- =============================================

DECLARE @RegionCode VARCHAR(4) = 'XXXX';

select

a.TA_TASK_ID as 'Task ID',
concat(convert(varchar(10),a.[TA_DUE_DATE],103),' ',convert(varchar(5),a.[TA_DUE_DATE],108)) as 'Logged Date',
b.BG_CODE as 'Building Code',
b.BG_SITE as 'Building',
d.CTR_REFERENCE as 'Contract Line',
a.TA_TASK_DESC as 'Task Type',
c.BDET_CALLER_SOURCE as 'Caller Source',
f.IN_SEQ as 'Instruction ID',
a.TA_SHORT_DESC as 'Short Description',
a.TA_LONG_DESC as 'Long Description',
a.TA_STATUS as 'Status',
concat(convert(varchar(10),e.EV_DATE_LOGGED,103),' ',convert(varchar(5),e.EV_DATE_LOGGED,108)) as 'Event Logged Date',
e.EV_EVENT as 'Event',
e.EV_COMMENTS as 'Comments',
e.EV_LOGGED_BY as 'Event Logged by'

from F_TASKS a

left outer join FLOCATE b with (nolock) on a.TA_FKEY_BG_SEQ=b.BG_SEQ
left outer join F_BD_DETAILS c with (nolock) on a.TA_SEQ = c.BDET_FKEY_TA_SEQ
left outer join F_CONTRACT d with (nolock) on a.TA_FKEY_CTR_SEQ=d.CTR_SEQ
left outer join F_EVENTS e with (nolock) on a.TA_SEQ = e.EV_FKEY_TA_SEQ
left outer join FINFILE f with (nolock) on a.TA_FKEY_IN_SEQ = f.IN_SEQ

where
(
    a.TA_TASK_DESC = 'PPM'
    OR LEFT(c.BDET_CALLER_SOURCE,3) = 'PPM'
)
and LEFT(b.BG_CODE,4) = @RegionCode
and a.TA_DUE_DATE > DATEADD(MONTH, -12, GETDATE())

order by a.TA_DUE_DATE desc
