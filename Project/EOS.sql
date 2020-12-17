USE [master]
GO
/****** Object:  Database [EOS]    Script Date: 30/07/2020 10:10:47 CH ******/
CREATE DATABASE [EOS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EOS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EOS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EOS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EOS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EOS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EOS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EOS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EOS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EOS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EOS] SET ARITHABORT OFF 
GO
ALTER DATABASE [EOS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EOS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EOS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EOS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EOS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EOS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EOS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EOS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EOS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EOS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EOS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EOS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EOS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EOS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EOS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EOS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EOS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EOS] SET  MULTI_USER 
GO
ALTER DATABASE [EOS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EOS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EOS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EOS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EOS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EOS]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 30/07/2020 10:10:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nchar](200) NULL,
	[isTrue] [bit] NULL,
	[QuestionID] [int] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam]    Script Date: 30/07/2020 10:10:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ExamCode] [nchar](100) NOT NULL,
	[ExamName] [nchar](50) NULL,
	[Time] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Exam_1] PRIMARY KEY CLUSTERED 
(
	[ExamCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 30/07/2020 10:10:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[user] [nchar](50) NULL,
	[pass] [nchar](50) NULL,
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[ExamCode] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 30/07/2020 10:10:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nchar](300) NULL,
	[Point] [float] NULL,
	[ExamCode] [nchar](100) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentExam]    Script Date: 30/07/2020 10:10:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login id] [int] NULL,
	[ExamCode] [nchar](100) NULL,
 CONSTRAINT [PK_StudentExam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentExamDetail]    Script Date: 30/07/2020 10:10:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExamDetail](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[StudentExamID] [int] NULL,
	[QuestionID] [int] NULL,
	[AnswerId] [int] NULL,
	[IsTrue] [bit] NULL,
 CONSTRAINT [PK_StudentExamDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (1, N'A - C# is a modern, general-purpose, object-oriented programming language developed by Microsoft.                                                                                                       ', 0, 1)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (2, N'B - C# was developed by Anders Hejlsberg and his team during the development of .Net Framework.                                                                                                         ', 0, 1)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (3, N'C - C# is designed for Common Language Infrastructure (CLI).                                                                                                                                            ', 0, 1)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (4, N'D - All of the above.                                                                                                                                                                                   ', 1, 1)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (5, N'A. dap an 1                                                                                                                                                                                             ', 1, 2)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (6, N'B.dap an 2                                                                                                                                                                                              ', 1, 2)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (7, N'C.dap an 3                                                                                                                                                                                              ', 0, 2)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (8, N'D.dap an 4                                                                                                                                                                                              ', 0, 2)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (9, N'A. dap an 1                                                                                                                                                                                             ', 1, 3)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (10, N'B.dap an 2                                                                                                                                                                                              ', 1, 3)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (11, N'C.dap an 3                                                                                                                                                                                              ', 0, 3)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (12, N'D.dap an 4                                                                                                                                                                                              ', 0, 3)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (13, N'A. dap an 1                                                                                                                                                                                             ', 1, 4)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (14, N'B.dap an 2                                                                                                                                                                                              ', 1, 4)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (15, N'C.dap an 3                                                                                                                                                                                              ', 0, 4)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (16, N'D.dap an 4                                                                                                                                                                                              ', 0, 4)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (17, N'A. dap an 1                                                                                                                                                                                             ', 1, 5)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (18, N'B.dap an 2                                                                                                                                                                                              ', 1, 5)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (19, N'C.dap an 3                                                                                                                                                                                              ', 0, 5)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (20, N'D.dap an 4                                                                                                                                                                                              ', 0, 5)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (21, N'A. dap an 1                                                                                                                                                                                             ', 1, 6)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (22, N'B.dap an 2                                                                                                                                                                                              ', 0, 6)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (23, N'C.dap an 3                                                                                                                                                                                              ', 0, 6)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (24, N'D.dap an 4                                                                                                                                                                                              ', 0, 6)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (25, N'A. dap an 1                                                                                                                                                                                             ', 1, 7)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (26, N'B.dap an 2                                                                                                                                                                                              ', 0, 7)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (27, N'C.dap an 3                                                                                                                                                                                              ', 0, 7)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (28, N'D.dap an 4                                                                                                                                                                                              ', 0, 7)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (29, N'A. dap an 1                                                                                                                                                                                             ', 1, 17)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (30, N'B.dap an 2                                                                                                                                                                                              ', 0, 17)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (31, N'C.dap an 3                                                                                                                                                                                              ', 0, 17)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (32, N'D.dap an 4                                                                                                                                                                                              ', 0, 17)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (33, N'A. dap an 1                                                                                                                                                                                             ', 1, 18)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (34, N'B.dap an 2                                                                                                                                                                                              ', 0, 18)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (35, N'C.dap an 3                                                                                                                                                                                              ', 0, 18)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (36, N'D.dap an 4                                                                                                                                                                                              ', 0, 18)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (37, N'A. dap an 1                                                                                                                                                                                             ', 1, 19)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (38, N'B.dap an 2                                                                                                                                                                                              ', 0, 19)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (39, N'C.dap an 3                                                                                                                                                                                              ', 0, 19)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (40, N'D.dap an 4                                                                                                                                                                                              ', 0, 19)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (41, N'A. dap an 1                                                                                                                                                                                             ', 1, 20)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (42, N'B.dap an 2                                                                                                                                                                                              ', 0, 20)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (43, N'C.dap an 3                                                                                                                                                                                              ', 0, 20)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (44, N'D.dap an 4                                                                                                                                                                                              ', 0, 20)
SET IDENTITY_INSERT [dbo].[Answer] OFF
INSERT [dbo].[Exam] ([ExamCode], [ExamName], [Time], [Date]) VALUES (N'C#code1                                                                                             ', N'C#                                                ', 50, CAST(N'2020-07-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Exam] ([ExamCode], [ExamName], [Time], [Date]) VALUES (N'Java                                                                                                ', N'Java                                              ', 60, CAST(N'2020-07-27 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([user], [pass], [LoginId], [ExamCode]) VALUES (N'duong                                             ', N'123                                               ', 1, N'C#code1                                                                                             ')
INSERT [dbo].[Login] ([user], [pass], [LoginId], [ExamCode]) VALUES (N'duong1                                            ', N'123                                               ', 2, N'Java                                                                                                ')
INSERT [dbo].[Login] ([user], [pass], [LoginId], [ExamCode]) VALUES (N'd1                                                ', N'123                                               ', 3, N'Java                                                                                                ')
INSERT [dbo].[Login] ([user], [pass], [LoginId], [ExamCode]) VALUES (N'duong                                             ', N'123                                               ', 4, N'Java                                                                                                ')
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (1, N'Q 1 - Which of the following is correct about C#?                                                                                                                                                                                                                                                           ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (2, N'cau hoi 2                                                                                                                                                                                                                                                                                                   ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (3, N'cau hoi 3                                                                                                                                                                                                                                                                                                   ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (4, N'cau hoi 4                                                                                                                                                                                                                                                                                                   ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (5, N'cau hoi 5                                                                                                                                                                                                                                                                                                   ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (6, N'cau hoi 6                                                                                                                                                                                                                                                                                                   ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (7, N'cau hoi 7                                                                                                                                                                                                                                                                                                   ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (8, N'cau hoi 8                                                                                                                                                                                                                                                                                                   ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (9, N'cau hoi 9                                                                                                                                                                                                                                                                                                   ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (10, N'cau hoi 10                                                                                                                                                                                                                                                                                                  ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (11, N'cau hoi 11                                                                                                                                                                                                                                                                                                  ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (12, N'cau hoi 12                                                                                                                                                                                                                                                                                                  ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (13, N'cau hoi 13                                                                                                                                                                                                                                                                                                  ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (14, N'cau hoi 14                                                                                                                                                                                                                                                                                                  ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (15, N'cau hoi 15                                                                                                                                                                                                                                                                                                  ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (16, N'cau hoi 16                                                                                                                                                                                                                                                                                                  ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (17, N'cau hoi 1                                                                                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (18, N'cau hoi 2                                                                                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (19, N'cau hoi 3                                                                                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (20, N'cau hoi 4                                                                                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (21, N'cau hoi 5                                                                                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (22, N'cau hoi 6                                                                                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (23, N'cau hoi 7                                                                                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (24, N'cau hoi 8                                                                                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (25, N'cau hoi 9                                                                                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (26, N'cau hoi 10                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (27, N'cau hoi 11                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (28, N'cau hoi 12                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (29, N'cau hoi 13                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (30, N'cau hoi 14                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (31, N'cau hoi 15                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (32, N'cau hoi 16                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[StudentExam] ON 

INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (1, 1, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (3, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (4, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (5, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (6, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (7, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (8, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (9, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (10, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (11, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (12, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (13, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (14, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (15, 4, N'Java                                                                                                ')
SET IDENTITY_INSERT [dbo].[StudentExam] OFF
SET IDENTITY_INSERT [dbo].[StudentExamDetail] ON 

INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (1, 1, 1, 1, NULL)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (2, 1, 1, 1, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (3, 9, 17, 29, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (4, 10, 1, 1, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (5, 11, 1, 1, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (6, 12, 1, 1, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (7, 12, 2, 5, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (8, 12, 2, 6, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (9, 12, 3, 9, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (10, 12, 4, 13, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (11, 12, 5, 17, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (12, 12, 6, 21, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (13, 13, 17, 29, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (14, 13, 18, 36, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (15, 14, 17, 29, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (16, 15, 17, 31, 0)
SET IDENTITY_INSERT [dbo].[StudentExamDetail] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Login]    Script Date: 30/07/2020 10:10:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_Login] ON [dbo].[Login]
(
	[user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Exam] FOREIGN KEY([ExamCode])
REFERENCES [dbo].[Exam] ([ExamCode])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Exam]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Exam] FOREIGN KEY([ExamCode])
REFERENCES [dbo].[Exam] ([ExamCode])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Exam]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_Exam] FOREIGN KEY([ExamCode])
REFERENCES [dbo].[Exam] ([ExamCode])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Exam]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_Login] FOREIGN KEY([Login id])
REFERENCES [dbo].[Login] ([LoginId])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Login]
GO
ALTER TABLE [dbo].[StudentExamDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamDetail_Answer] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answer] ([AnswerId])
GO
ALTER TABLE [dbo].[StudentExamDetail] CHECK CONSTRAINT [FK_StudentExamDetail_Answer]
GO
ALTER TABLE [dbo].[StudentExamDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamDetail_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[StudentExamDetail] CHECK CONSTRAINT [FK_StudentExamDetail_Question]
GO
ALTER TABLE [dbo].[StudentExamDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamDetail_StudentExam] FOREIGN KEY([StudentExamID])
REFERENCES [dbo].[StudentExam] ([id])
GO
ALTER TABLE [dbo].[StudentExamDetail] CHECK CONSTRAINT [FK_StudentExamDetail_StudentExam]
GO
USE [master]
GO
ALTER DATABASE [EOS] SET  READ_WRITE 
GO
