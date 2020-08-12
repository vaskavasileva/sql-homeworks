create database SEDCHome
use SEDCHome

create table dbo.Student
(
ID int identity(1,1) NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NULL,
EnrolledDate date NULL,
Gender nchar(1) NULL,
NationalIDNumber int NULL,
StudentCardNumber nvarchar(20) NOT NULL,

constraint [pk_Student] primary key clustered(ID asc)
)

create table dbo.Course
(
ID int identity(1,1) NOT NULL,
[Name] nvarchar(100) NOT NULL,
Credit int NULL,
AcademicYear int NULL,
Semester int NULL,

constraint [pk_Course] primary key clustered(ID asc)
)

create table dbo.Teacher
(
ID int identity(1,1) NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date NULL,
AcademicRank nvarchar(100) NULL,
HireDate date NULL,

constraint [pk_Teacher] primary key clustered(ID asc)
)

create table dbo.GradeDetails
(
ID int identity(1,1) NOT NULL,
GradeID int NOT NULL,
AchievementTypeID int NOT NULL,
AchievementPoints int NULL,
AchievementMaxPoints int NULL,
AchievementDate datetime NULL,

constraint [pk_GradeDetails] primary key clustered(ID asc)
)

create table dbo.Grade
(
ID int identity (1,1) NOT NULL,
StudentID int NOT NULL,
CourseID int NOT NULL,
TeacherID int NOT NULL,
Grade int NOT NULL,
Comment nvarchar(max) NULL,
CreatedDate datetime NULL,

constraint [pk_Grade] primary key clustered(ID asc)
)

create table dbo.AchievementType
(
ID int identity(1,1) NOT NULL,
[Name] nvarchar(100) NOT NULL,
[Description] nvarchar(max) NULL,
ParticipationRate int NULL,

constraint [pk_AchievementType] primary key clustered(ID asc)
)