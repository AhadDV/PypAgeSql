create function [dbo].[AgeAtDate](
    @DOB    datetime,
    @PassedDate datetime
)

returns int
with SCHEMABINDING
as
begin

declare @iMonthDayDob int
declare @iMonthDayPassedDate int


select @iMonthDayDob = CAST(datepart (mm,@DOB) * 100 + datepart  (dd,@DOB) AS int) 
select @iMonthDayPassedDate = CAST(datepart (mm,@PassedDate) * 100 + datepart  (dd,@PassedDate) AS int) 

return DateDiff(yy,@DOB, @PassedDate) 
- CASE WHEN @iMonthDayDob <= @iMonthDayPassedDate
  THEN 0 
  ELSE 1
  END

End