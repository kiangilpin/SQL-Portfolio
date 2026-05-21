-- =============================================
-- Project: Task Monitoring and SLA Analysis
-- Description:
-- Retrieves task-level data including status, location,
-- and SLA performance indicators such as days overdue
-- and RAG (Red/Amber/Green) status.
-- Context:
-- Used within a CAFM system to track operational performance
-- across buildings and contracts.
-- =============================================

select

b.BG_SITE as 'Building',
a.TA_TASK_ID as 'Task ID',
a.TA_SHORT_DESC as 'Short Description',
a.TA_LONG_DESC as 'Long Description',
a.TA_CATEGORY as 'Category',
c.LO_DESCRIPTION as 'Location',
a.TA_STATUS as 'Status',
a.TA_LOC as 'LOC',

-------DATE FORMATING
concat(convert(varchar(10),a.[TA_DUE_DATE],103),' ',convert(varchar(5),a.[TA_DUE_DATE],108)) as 'Logged Date',
concat(convert(varchar(10),a.[TA_EST_DATE],103),' ',convert(varchar(5),a.[TA_EST_DATE],108)) as 'Due Date',
concat(convert(varchar(10),h.[TaskPerfAttendDate],103),' ',convert(varchar(5),h.[TaskPerfAttendDate],108)) as 'Started Date',

-------DAY COUNT
DATEDIFF(day, a.TA_EST_DATE, GETDATE()) as 'Days',

-------RAG

case
when a.TA_EST_DATE < GETDATE() then 'RED'
when DATEDIFF(day, a.TA_EST_DATE, GETDATE()) = 0 then 'AMBER'
else 'GREEN'
end as 'RAG'

  ------LATE
case
when a.TA_EST_DATE<GETDATE() then 'Yes'
else 'No'
end as 'Late'

from F_TASKS a

-------TABLES
left outer join FLOCATE b on a.TA_FKEY_BG_SEQ=b.BG_SEQ
left outer join FAREALO c on a.TA_FKEY_LO_SEQ=c.LO_SEQ
left outer join F_CONTRACT d on a.TA_FKEY_CTR_SEQ=d.CTR_SEQ
left outer join SLA_TASK_PERFORMANCE h on a.TA_SEQ=h.TASKPERF_TA_SEQ
