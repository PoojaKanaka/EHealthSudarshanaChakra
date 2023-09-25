--Role table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_NAME   = 'Role')
   BEGIN
   CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [nchar](50) NOT NULL,
	CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
	(
		[RoleId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO
--Department table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_NAME   = 'Department')
   BEGIN
   CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] NOT NULL,
	[DepartmentName] [nchar](50) NOT NULL,
	CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
	(
		[DepartmentId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

--Login table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_NAME   = 'Login')
   BEGIN
   CREATE TABLE [dbo].[Login](
	[UserId] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
	(
		[UserId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END
GO

--HospitalDetails table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_NAME   = 'HospitalDetails')
   BEGIN
   CREATE TABLE [dbo].[HospitalDetails](
	[HospitalId] [int] NOT NULL,
	[HospitalName] [nchar](50) NOT NULL,
	[Address] [nvarchar](max) NULL,
	CONSTRAINT [PK_HospitalDetails] PRIMARY KEY CLUSTERED 
	(
		[HospitalId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END
GO

--Diagnosis table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_NAME   = 'Diagnosis')
   BEGIN
	CREATE TABLE [dbo].[Diagnosis](
		[DiagnosisId] [nchar](50) NOT NULL,
		[DiagnosisDescription] [nvarchar](50) NULL,
		[Symptoms] [nvarchar](50) NULL,
	CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
	(
		[DiagnosisId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	END
GO

--DoctorDetails table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_NAME   = 'DoctorDetails')
   BEGIN
	CREATE TABLE [dbo].[DoctorDetails](
		[UserId] [int] NOT NULL,
		[UserFirstName] [nvarchar](50) NULL,
		[UserLastName] [nvarchar](50) NULL,
		[RoleId] [int] NOT NULL,
		[DepartmentId] [int] NOT NULL,
	CONSTRAINT [PK_DoctorDetails] PRIMARY KEY CLUSTERED 
	(
		[UserId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	ALTER TABLE [dbo].[DoctorDetails]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDetails_Department] FOREIGN KEY([DepartmentId])
	REFERENCES [dbo].[Department] ([DepartmentId])
	
	ALTER TABLE [dbo].[DoctorDetails] CHECK CONSTRAINT [FK_DoctorDetails_Department]
	
	ALTER TABLE [dbo].[DoctorDetails]  WITH CHECK ADD  CONSTRAINT [FK_DoctorDetails_Role] FOREIGN KEY([RoleId])
	REFERENCES [dbo].[Role] ([RoleId])

	ALTER TABLE [dbo].[DoctorDetails] CHECK CONSTRAINT [FK_DoctorDetails_Role]
	END
GO

--PatientDetails table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_NAME   = 'PatientDetails')
   BEGIN
	CREATE TABLE [dbo].[PatientDetails](
		[UserId] [int] NOT NULL,
		[UserFirstName] [nvarchar](50) NOT NULL,
		[UserLastName] [nvarchar](50) NULL,
		[Age] [int] NOT NULL,
		[Address] [nvarchar](max) NOT NULL,
		[MobileNo] [nchar](15) NOT NULL,
		[EmailId] [nvarchar](50) NULL,
	CONSTRAINT [PK_PatientDetails] PRIMARY KEY CLUSTERED 
	(
		[UserId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END
GO

--VisitDetails table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_NAME   = 'VisitDetails')
   BEGIN
	CREATE TABLE [dbo].[VisitDetails](
	[AbhaId] [nchar](50) NOT NULL,
	[VisitId] [nchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[HospitalId] [int] NOT NULL,
	[AdmitDate] [datetime] NULL,
	[DischargeDate] [datetime] NULL,
	[InpatientOrOutpatient] [char](1) NOT NULL,
	[DiagnosisId] [nchar](50) NULL,
	CONSTRAINT [PK_VisitDetails] PRIMARY KEY CLUSTERED 
	(
		[AbhaId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	ALTER TABLE [dbo].[VisitDetails]  WITH CHECK ADD  CONSTRAINT [FK_VisitDetails_Diagnosis] FOREIGN KEY([DiagnosisId])
	REFERENCES [dbo].[Diagnosis] ([DiagnosisId])
	
	ALTER TABLE [dbo].[VisitDetails] CHECK CONSTRAINT [FK_VisitDetails_Diagnosis]
	
	ALTER TABLE [dbo].[VisitDetails]  WITH CHECK ADD  CONSTRAINT [FK_VisitDetails_HospitalDetails] FOREIGN KEY([HospitalId])
	REFERENCES [dbo].[HospitalDetails] ([HospitalId])
	
	ALTER TABLE [dbo].[VisitDetails] CHECK CONSTRAINT [FK_VisitDetails_HospitalDetails]
	
	ALTER TABLE [dbo].[VisitDetails]  WITH CHECK ADD  CONSTRAINT [FK_VisitDetails_PatientDetails] FOREIGN KEY([UserId])
	REFERENCES [dbo].[PatientDetails] ([UserId])
	
	ALTER TABLE [dbo].[VisitDetails] CHECK CONSTRAINT [FK_VisitDetails_PatientDetails]
	END
GO

--Invoice table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_NAME   = 'Invoice')
   BEGIN
	CREATE TABLE [dbo].[Invoice](
		[InvoiceId] [int] NOT NULL,
		[AbhaId] [nchar](50) NOT NULL,
		[VisitId] [nchar](50) NOT NULL,
		[DiagnosisId] [nchar](50) NULL,
		[Amount] [float] NOT NULL,
		[Discount] [decimal](18, 0) NULL,
	CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
	(
		[InvoiceId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Diagnosis] FOREIGN KEY([DiagnosisId])
	REFERENCES [dbo].[Diagnosis] ([DiagnosisId])
	
	ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Diagnosis]
	
	ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_VisitDetails_AbhaId] FOREIGN KEY([AbhaId])
	REFERENCES [dbo].[VisitDetails] ([AbhaId])
	
	ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_VisitDetails_AbhaId]
	END
GO

