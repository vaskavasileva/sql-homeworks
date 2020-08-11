alter table dbo.Grade WITH CHECK
add constraint fk_Grade_Course
foreign key(CourseID)
references dbo.Course(Id)

alter table dbo.Grade WITH CHECK
add constraint fk_Grade_Student
foreign key(StudentID)
references dbo.Student(Id)

alter table dbo.Grade WITH CHECK
add constraint fk_Grade_Teacher
foreign key(TeacherID)
references dbo.Teacher(Id)

alter table dbo.GradeDetails WITH CHECK
add constraint fk_GradeDetails_Grade
foreign key(GradeID)
references dbo.Grade(Id)

alter table dbo.GradeDetails WITH CHECK
add constraint fk_GradeDetails_AchievementType
foreign key(AchievementTypeID)
references dbo.AchievementType(Id)