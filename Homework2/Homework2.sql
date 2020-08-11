select *
from dbo.Student
where FirstName = 'Antonio'

select *
from dbo.Student
where DateOfBirth > '1999.01.01'

select *
from dbo.Student
where Gender = 'M'

select *
from dbo.Student
where LastName like 'T%'

select *
from dbo.Student
where EnrolledDate >= '1998.01.01' AND EnrolledDate < '1998.02.01'

select *
from dbo.Student
where LastName like 'J%' AND EnrolledDate >= '1998.01.01' AND EnrolledDate < '1998.02.01'

select *
from dbo.Student
where FirstName = 'Antonio'
order by LastName asc

select *
from dbo.Student
order by FirstName asc

select *
from dbo.Student
where Gender = 'M'
order by EnrolledDate desc

select FirstName
from dbo.Teacher
UNION ALL
select FirstName
from dbo.Student

select LastName
from dbo.Teacher
UNION 
select LastName
from dbo.Student

select FirstName
from dbo.Teacher
INTERSECT
select FirstName
from dbo.Student

alter table dbo.GradeDetails
add constraint DF_GradeDetails_AchievementMaxPoints 
default 100 for AchievementMaxPoints

alter table dbo.GradeDetails WITH CHECK
add constraint CHK_GradeDetails_AchievementPoints
check (AchievementPoints<=AchievementMaxPoints)

alter table dbo.AchievementType WITH CHECK
add constraint UN_AchievementType_Name UNIQUE ([Name])

