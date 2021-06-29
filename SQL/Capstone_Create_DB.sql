USE [master]

IF db_id('Capstone') IS NULL
  CREATE DATABASE [Capstone]
GO

USE Capstone
GO

DROP TABLE IF EXISTS [UserProfile];
DROP TABLE IF EXISTS [Student];
DROP TABLE IF EXISTS [Class];
DROP TABLE IF EXISTS [Assignment];
DROP TABLE IF EXISTS [StudentAssignment];
GO

CREATE TABLE [UserProfile] (
  [Id] INTEGER PRIMARY KEY IDENTITY(1, 1),
  [FirebaseId] NVARCHAR(28) NOT NULL,
  [Username] NVARCHAR(255) NOT NULL,
  [FirstName] NVARCHAR(255) NOT NULL,
  [LastName] NVARCHAR(255) NOT NULL,
  [Email] NVARCHAR(255) NOT NULL,
  [ProfileImage] NVARCHAR(255)

  CONSTRAINT UQ_FirebaseId UNIQUE(FirebaseId)
)
GO

CREATE TABLE [Student] (
  [Id] INTEGER PRIMARY KEY IDENTITY(1, 1),
  [FirebaseId] NVARCHAR(28) NOT NULL,
  [Username] NVARCHAR(255) NOT NULL,
  [FirstName] NVARCHAR(255) NOT NULL,
  [LastName] NVARCHAR(255) NOT NULL,
  [Email] NVARCHAR(255) NOT NULL,
  [ProfileImage] NVARCHAR(255)
)
GO

CREATE TABLE [Class] (
  [Id] INTEGER PRIMARY KEY IDENTITY(1, 1),
  [Name] NVARCHAR(255) NOT NULL,
  [Begin] DATETIME,
  [End] DATETIME,
  [TeacherId] INTEGER NOT NULL
)
GO

CREATE TABLE [Assignment] (
  [Id] INTEGER PRIMARY KEY IDENTITY(1, 1),
  [Name] NVARCHAR(255) NOT NULL,
  [Instructions] TEXT NOT NULL,
  [DueDate] DATETIME,
  [ClassId] INTEGER NOT NULL
)
GO

CREATE TABLE [StudentAssignment] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [Submitted] BIT NOT NULL,
  [Grade] INTEGER,
  [Feedback] TEXT,
  [StudentId] INTEGER NOT NULL,
  [AssignmentId] INTEGER NOT NULL
)
GO

ALTER TABLE [Assignment] ADD FOREIGN KEY ([ClassId]) REFERENCES [Class] ([Id])
GO

ALTER TABLE [StudentAssignment] ADD FOREIGN KEY ([StudentId]) REFERENCES [Student] ([Id])
GO

ALTER TABLE [StudentAssignment] ADD FOREIGN KEY ([AssignmentId]) REFERENCES [Assignment] ([Id])
GO

ALTER TABLE [Class] ADD FOREIGN KEY ([TeacherId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [Student] ADD FOREIGN KEY ([Id]) REFERENCES [Class] ([Id])
GO
