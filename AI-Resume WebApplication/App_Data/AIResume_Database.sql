-- ====================================================================
-- AI RESUME BUILDER - DATABASE SCRIPT (5 TABLES)
-- ====================================================================
-- Tables : Users, CareerProfile, Skills, Education, Experience
--
-- Relationships:
--   Users 1 --- 1 --- CareerProfile   (one user = one career profile)
--   Users 1 --- N --- Skills          (one user = many skills)
--   Users 1 --- N --- Education       (one user = many education records)
--   Users 1 --- N --- Experience      (one user = many experience records)
--
-- HOW TO RUN:
--   Visual Studio : Server Explorer > Data Connections > ApplicationDatabase.mdf
--                   > right click > New Query > paste this script > Execute
--   SSMS          : connect to (LocalDB)\MSSQLLocalDB, select your database
--                   in the dropdown, open New Query, paste and Execute
--
-- WARNING: This script DELETES the old tables first and creates them again.
--          Run it only when you want a fresh database.
-- ====================================================================


-- ====================================================================
-- STEP 1 : Delete old tables (child tables first, Users last)
-- A child table must be dropped before its parent because of the
-- foreign keys.
-- ====================================================================

IF OBJECT_ID('Experience', 'U') IS NOT NULL DROP TABLE Experience;
IF OBJECT_ID('Education', 'U') IS NOT NULL DROP TABLE Education;
IF OBJECT_ID('Skills', 'U') IS NOT NULL DROP TABLE Skills;
IF OBJECT_ID('CareerProfile', 'U') IS NOT NULL DROP TABLE CareerProfile;
IF OBJECT_ID('Users', 'U') IS NOT NULL DROP TABLE Users;
GO


-- ====================================================================
-- STEP 2 : Create tables (parent table first, then child tables)
-- ====================================================================

-- --------------------------------------------------------------------
-- TABLE 1 : Users
-- Stores login information. Role decides User Panel or Admin Panel.
-- --------------------------------------------------------------------
CREATE TABLE Users
(
    Id          INT IDENTITY(1,1) NOT NULL,
    FullName    NVARCHAR(100)     NOT NULL,
    Email       NVARCHAR(100)     NOT NULL,
    Password    NVARCHAR(100)     NOT NULL,
    Role        NVARCHAR(20)      NOT NULL DEFAULT 'User',
    CreatedAt   DATETIME          NOT NULL DEFAULT GETDATE(),

    CONSTRAINT PK_Users PRIMARY KEY (Id),
    CONSTRAINT UQ_Users_Email UNIQUE (Email),
    CONSTRAINT CK_Users_Role CHECK (Role IN ('User', 'Admin'))
);
GO


-- --------------------------------------------------------------------
-- TABLE 2 : CareerProfile   (1 : 1 with Users)
-- UNIQUE on UserId means one user can have only ONE career profile.
-- --------------------------------------------------------------------
CREATE TABLE CareerProfile
(
    CareerProfileId      INT IDENTITY(1,1) NOT NULL,
    UserId               INT               NOT NULL,
    ProfessionalTitle    NVARCHAR(100)     NULL,
    ProfessionalSummary  NVARCHAR(MAX)     NULL,

    CONSTRAINT PK_CareerProfile PRIMARY KEY (CareerProfileId),
    CONSTRAINT UQ_CareerProfile_UserId UNIQUE (UserId),
    CONSTRAINT FK_CareerProfile_Users FOREIGN KEY (UserId)
        REFERENCES Users(Id) ON DELETE CASCADE
);
GO
