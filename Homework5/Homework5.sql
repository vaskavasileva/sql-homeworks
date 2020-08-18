
create function dbo.fn_MultiStatement (@TeacherID int)
returns @MyTable table (StudentFirstName nvarchar(50), StudentLastName nvarchar(50), Grade int, CreatedDate datetime)
as
begin

	insert into @MyTable(StudentFirstName,StudentLastName,Grade,CreatedDate)
	select s.FirstName, s.LastName, g.Grade, g.CreatedDate
	from dbo.Student s
	inner join dbo.Grade g
	on g.StudentID = s.ID
	inner join dbo.Teacher t
	on g.TeacherID = t.ID
	where t.ID = @TeacherID

return
end

select *
from dbo.fn_MultiStatement(2)