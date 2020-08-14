


--Declare scalar variable for storing FirstName values?
declare @FirstName nvarchar(100)

--Assign value ‘Antonio’ to the FirstName variable?
set @FirstName = 'Antonio'

--Find all Students having FirstName same as the variable?
select *
from dbo.Student
where FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth?
declare @MyTable table (StudentId int, StudentName nvarchar(200), DateOfBirth datetime)

--Fill the table variable with all Female students?
insert into @MyTable
select Id, FirstName + ' ' + LastName, DateOfBirth
from dbo.Student
where Gender = 'F'

select *
from @MyTable

--Declare temp table that will contain LastName and EnrolledDate columns?
create table #MyNewTable (LastName nvarchar(50), EnrolledDate datetime)

--Fill the temp table with all Male students having First Name starting with ‘A’?
insert into #MyNewTable
select LastName, EnrolledDate
from dbo.Student
where Gender = 'M' and FirstName like 'A%'

select *
from #MyNewTable

--Retrieve the students from the table which last name is with 7 characters?
select *
from #MyNewTable
where LEN(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and? the first 3 characters of their FirstName and LastName are the same
select *
from dbo.Teacher
where LEN(FirstName) < 5 and LEFT(FirstName, 3) = LEFT(LastName, 3)

--Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:?
--StudentCardNumber without “sc-”?
--“ – “?
--First character of student FirstName?
--“.”?
--Student LastName

create function dbo.fn_FormatStudentName(@StudentID int)
returns nvarchar(200)
as
begin
	
	declare @result nvarchar(200)

	select @result = SUBSTRING(StudentCardNumber, 4, 5) + N' - ' + LEFT(FirstName, 1) + '.' + LastName
	from dbo.Student
	where @StudentID = ID

	return @result

end

select [dbo].[fn_FormatStudentName](ID) as StudentDescription
from dbo.Student