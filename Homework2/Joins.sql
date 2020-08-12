select c.[Name] as CourseName, a.[Name] as AchievementType
from dbo.Course c
cross join dbo.AchievementType a
group by c.[Name], a.[Name]

select distinct t.[FirstName] + ' ' + t.[LastName] as TeachersWithGrades
from dbo.Teacher t
inner join dbo.Grade g
on t.ID = g.TeacherID
group by t.[FirstName] + ' ' + t.[LastName]

select distinct t.FirstName + ' ' + t.LastName as TeachersWithoutGrade
from dbo.Teacher t
left join dbo.Grade g
on t.ID = g.TeacherID
where g.ID is NULL
group by t.FirstName + ' ' + t.LastName

select distinct s.FirstName + ' ' + s.LastName as StudentsWithoutGrade
from dbo.Grade g
right join dbo.Student s
on g.StudentID = s.ID
where g.ID is NULL
group by s.FirstName + ' ' + s.LastName
