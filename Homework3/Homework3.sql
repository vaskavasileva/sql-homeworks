--Calculate the count of all grades in the system?
select COUNT(g.ID) as GradeCount
from dbo.Grade g

--Calculate the count of all grades per Teacher in the system?
select distinct t.FirstName + ' ' + t.LastName as Teacher,COUNT(g.ID) as [Count]
from dbo.Grade g
inner join dbo.Teacher t
on g.TeacherID = t.ID
group by t.FirstName + ' ' + t.LastName

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
select distinct t.FirstName + ' ' + t.LastName as Teacher,COUNT(g.ID) as [Count]
from dbo.Grade g
inner join dbo.Teacher t
on g.TeacherID = t.ID
where g.StudentID < 100
group by t.FirstName + ' ' + t.LastName

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system?
select s.FirstName + ' ' + s.LastName as StudentName, AVG(g.Grade) as AverageGrade, MAX(g.Grade) as MaximalGrade 
from dbo.Grade g
inner join dbo.Student s
on g.StudentID = s.ID
group by s.FirstName + ' ' + s.LastName

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
select distinct t.FirstName + ' ' + t.LastName as Teacher,COUNT(g.ID) as [Count]
from dbo.Grade g
inner join dbo.Teacher t
on g.TeacherID = t.ID
group by t.FirstName + ' ' + t.LastName
having COUNT(g.ID) > 200

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count?
select distinct t.FirstName + ' ' + t.LastName as Teacher,COUNT(g.ID) as [Count]
from dbo.Grade g
inner join dbo.Teacher t
on g.TeacherID = t.ID
inner join dbo.Student s 
on g.StudentID = s.ID
where s.ID < 100
group by t.FirstName + ' ' + t.LastName
having COUNT(g.ID) > 50

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade?
select s.FirstName + ' ' + s.LastName as StudentName, AVG(g.Grade) as AverageGrade, MAX(g.Grade) as MaximalGrade, COUNT(g.ID) as GradeCount
from dbo.Grade g
inner join dbo.Student s
on g.StudentID = s.ID
group by s.FirstName + ' ' + s.LastName
having MAX(g.Grade) = AVG(g.Grade)

--List Student First Name and Last Name next to the other details from previous query
select s.FirstName as FirstName, s.LastName as LastName, AVG(g.Grade) as AverageGrade, MAX(g.Grade) as MaximalGrade, COUNT(g.ID) as GradeCount
from dbo.Grade g
inner join dbo.Student s
on g.StudentID = s.ID
group by s.FirstName, s.LastName
having MAX(g.Grade) = AVG(g.Grade)

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student?
create view dbo.vv_StudentGrades
as 
select distinct g.StudentID as StudentID, COUNT(g.ID) as StudentGradeCount
from dbo.Grade g
group by g.StudentID

select *
from dbo.vv_StudentGrades

--Change the view to show Student First and Last Names instead of StudentID?
alter view dbo.vv_StudentGrades
as
select distinct s.FirstName as FirstName, s.LastName as LastName, COUNT(g.ID) as StudentGradeCount
from dbo.Grade g
inner join dbo.Student s
on g.StudentID = s.ID
group by s.FirstName, s.LastName

select *
from dbo.vv_StudentGrades

--List all rows from view ordered by biggest Grade Count?
select * 
from dbo.vv_StudentGrades
order by StudentGradeCount desc

--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit)
create view dbo.vv_StudentGradeDetails
as
select s.FirstName, s.LastName, COUNT(c.ID) as CourseCount
from dbo.Grade g
inner join dbo.Student s
on g.StudentID = s.ID
inner join dbo.Course c
on g.CourseID = c.ID
inner join dbo.GradeDetails gd
on gd.GradeID = g.ID
inner join dbo.AchievementType a
on gd.AchievementTypeID = a.ID
where a.[Name] = 'Ispit'
group by s.FirstName, s.LastName

select *
from dbo.vv_StudentGradeDetails