
-- Code SQL pour le schéma

CREATE TABLE [Chapters] (
        [id] [int] PRIMARY KEY AUTOINCREMENT,
        [name] [VARCHAR](50) NOT NULL,
        [description] [VARCHAR](200) NULL,
        [course_id] [int] NULL
)

 
CREATE TABLE [Classes](
        [id] [int] PRIMARY KEY,
        [name] [VARCHAR](15) NOT NULL,
        [section] [VARCHAR](25) NULL,
        [professor_id] [int] NULL
)


CREATE TABLE [Courses](
        [id] [int] NOT NULL PRIMARY KEY,
        [name] [VARCHAR](50) NULL,
        [professor_id] [int] NOT NULL
)

CREATE TABLE [Professor](
        [id] [int] PRIMARY KEY,
        [name] [VARCHAR](50) NOT NULL,
        [firstname] [VARCHAR](50) NULL,
        [password] [VARCHAR](20) NULL,
        [cours_id] [int] NOT NULL
)


CREATE TABLE [professorClass](
        [prof_id] [int] NOT NULL,
        [class_id] [int] NOT NULL,
        PRIMARY KEY (prof_id, class_id)
)

GO
/****** Object:  Table [professorCourse]    Script Date: 19.05.2017 12:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [professorCourse](
        [profId] [int] NOT NULL,
        [courId] [int] NOT NULL,
 CONSTRAINT [PK_professorCourse] PRIMARY KEY CLUSTERED 
(
        [profId] ASC,
        [courId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Student]    Script Date: 19.05.2017 12:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Student](
        [studId] [int] NOT NULL,
        [studName] [VARCHAR](50) NOT NULL,
        [studFirstname] [VARCHAR](50) NULL,
        [studPassword] [VARCHAR](20) NULL,
        [studClassId] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
        [studId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Task]    Script Date: 19.05.2017 12:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Task](
        [taskId] [int] NOT NULL,
        [taskName] [VARCHAR](50) NOT NULL,
        [taskValidated] [int] NOT NULL,
        [taskFilepath] [VARCHAR](50) NULL,
        [taskChapterId] [int] NULL,
        [taskStudentId] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
        [taskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_professorCourse]    Script Date: 19.05.2017 12:41:04 ******/
CREATE NONCLUSTERED INDEX [IX_professorCourse] ON [professorCourse]
(
        [profId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Chapter_Course] FOREIGN KEY([chapCourseId])
REFERENCES [Course] ([courId])
GO
ALTER TABLE [Chapter] CHECK CONSTRAINT [FK_Chapter_Course]
GO
ALTER TABLE [Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([studClassId])
REFERENCES [Class] ([clasId])
GO
ALTER TABLE [Student] CHECK CONSTRAINT [FK_Student_Class]
GO
ALTER TABLE [Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Chapter] FOREIGN KEY([taskChapterId])
REFERENCES [Chapter] ([chapId])
GO
ALTER TABLE [Task] CHECK CONSTRAINT [FK_Task_Chapter]
GO
ALTER TABLE [Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Student] FOREIGN KEY([taskStudentId])
REFERENCES [Student] ([studId])
GO
ALTER TABLE [Task] CHECK CONSTRAINT [FK_Task_Student]
GO
USE [master]
GO
ALTER DATABASE [Homeworks] SET  READ_WRITE 
GO