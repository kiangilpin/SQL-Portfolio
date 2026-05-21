
-- =============================================
-- Project: Account Licence Management
-- Description:
-- Retrieves account-level information including licence,
-- status (locked/disabled), and audit details for reporting.
-- Context:
-- Based on CAFM system data used for user and licence management
-- =============================================

select
ac.AccountId as 'Account ID',
ac.LoginName as 'Username',
ac.FullName as 'Full Name',
ac.Description as 'Account Description',
l.Name as 'Licence',
convert(varchar(10),ac.[CreatedDate],103) as 'Created Date',
case
when ac.AccountId = ac.CreatedBy then ac.LoginName
else null
end as 'Created By',
end as 'Created By',
convert(varchar(10),aC.[ModifiedDate],103) as 'Modified Date',
case
when ac.AccountId=ac.ModifiedBy
then ac.LoginName
end as 'Modified By',
case when ac.Locked = '0' then 'No'
else 'Yes'
end as 'Locked',
case when ac.AccountDisabled = '0' then 'No'
else 'Yes'
end as 'Disabled',
convert(varchar(10),ac.[AccountDisabledDate],103) as 'Disabled Date'

from dbo.Accounts ac

left outer join dbo.AccountsUserLicenceTypes al on ac.AccountId=al.AccountId
left outer join dbo.UserLicenceTypes l on al.UserLicenceTypeId=l.UserLicenceTypeId
