USE [recording stu ]
GO
/****** Object:  Table [dbo].[adds]    Script Date: 16/06/2020 11:10:45 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adds](
	[studentID] [int] NOT NULL,
	[administrationID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[administration]    Script Date: 16/06/2020 11:10:45 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administration](
	[administrationID] [int] IDENTITY(1,1) NOT NULL,
	[administrationname] [nvarchar](max) NOT NULL,
	[administrationpassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__administ__0E9A0801A26C9C61] PRIMARY KEY CLUSTERED 
(
	[administrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[courses]    Script Date: 16/06/2020 11:10:45 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[courseID] [int] IDENTITY(1,1) NOT NULL,
	[coursename] [nvarchar](max) NOT NULL,
	[coursedetails] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__courses__2AA84FF19CB4A234] PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 16/06/2020 11:10:45 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Departme__B2079BCDEFDB6C16] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[exams]    Script Date: 16/06/2020 11:10:45 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[examregno] [int] NOT NULL,
	[sname] [nvarchar](max) NOT NULL,
	[marks] [nvarchar](max) NOT NULL,
	[course] [nvarchar](max) NOT NULL,
	[DepartmentID] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fees]    Script Date: 16/06/2020 11:10:45 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fees](
	[studentID] [int] NOT NULL,
	[sname] [nvarchar](max) NOT NULL,
	[receiptno] [nvarchar](max) NOT NULL,
	[dateofreceipt] [nvarchar](max) NOT NULL,
	[tutionfee] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[registered]    Script Date: 16/06/2020 11:10:45 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registered](
	[studentID] [int] NOT NULL,
	[courseID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student]    Script Date: 16/06/2020 11:10:45 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[studentID] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](100) NOT NULL,
	[lastname] [nvarchar](max) NOT NULL,
	[studentaddress] [nvarchar](max) NOT NULL,
	[studentphone] [nvarchar](max) NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK__student__4D11D65C133ED06D] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[teaches]    Script Date: 16/06/2020 11:10:45 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teaches](
	[courseID] [int] NULL,
	[administrationID] [int] NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[adds]  WITH CHECK ADD  CONSTRAINT [FK__adds__administra__2C3393D0] FOREIGN KEY([administrationID])
REFERENCES [dbo].[administration] ([administrationID])
GO
ALTER TABLE [dbo].[adds] CHECK CONSTRAINT [FK__adds__administra__2C3393D0]
GO
ALTER TABLE [dbo].[adds]  WITH CHECK ADD  CONSTRAINT [FK__adds__studentID__2B3F6F97] FOREIGN KEY([studentID])
REFERENCES [dbo].[student] ([studentID])
GO
ALTER TABLE [dbo].[adds] CHECK CONSTRAINT [FK__adds__studentID__2B3F6F97]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK__exmans__Departme__2A4B4B5E] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK__exmans__Departme__2A4B4B5E]
GO
ALTER TABLE [dbo].[Fees]  WITH CHECK ADD  CONSTRAINT [FK__Fees__studentID__0C85DE4D] FOREIGN KEY([studentID])
REFERENCES [dbo].[student] ([studentID])
GO
ALTER TABLE [dbo].[Fees] CHECK CONSTRAINT [FK__Fees__studentID__0C85DE4D]
GO
ALTER TABLE [dbo].[registered]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[courses] ([courseID])
GO
ALTER TABLE [dbo].[registered]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[student] ([studentID])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_Departments]
GO
ALTER TABLE [dbo].[teaches]  WITH CHECK ADD  CONSTRAINT [FK__teaches__adminis__2D27B809] FOREIGN KEY([administrationID])
REFERENCES [dbo].[administration] ([administrationID])
GO
ALTER TABLE [dbo].[teaches] CHECK CONSTRAINT [FK__teaches__adminis__2D27B809]
GO
ALTER TABLE [dbo].[teaches]  WITH CHECK ADD  CONSTRAINT [FK__teaches__courseI__2F10007B] FOREIGN KEY([courseID])
REFERENCES [dbo].[courses] ([courseID])
GO
ALTER TABLE [dbo].[teaches] CHECK CONSTRAINT [FK__teaches__courseI__2F10007B]
GO
