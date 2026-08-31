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
    Phone                NVARCHAR(20)      NULL,
    Location             NVARCHAR(100)     NULL,
    LinkedInUrl          NVARCHAR(255)     NULL,
    PortfolioUrl         NVARCHAR(255)     NULL,

    CONSTRAINT PK_CareerProfile PRIMARY KEY (CareerProfileId),
    CONSTRAINT UQ_CareerProfile_UserId UNIQUE (UserId),
    CONSTRAINT FK_CareerProfile_Users FOREIGN KEY (UserId)
        REFERENCES Users(Id) ON DELETE CASCADE
);
GO

-- --------------------------------------------------------------------
-- TABLE 3 : Skills   (1 : N with Users)
-- --------------------------------------------------------------------
CREATE TABLE Skills
(
    SkillId        INT IDENTITY(1,1) NOT NULL,
    UserId         INT               NOT NULL,
    SkillName      NVARCHAR(100)     NOT NULL,
    SkillCategory  NVARCHAR(50)      NULL,
    SkillLevel     NVARCHAR(30)      NULL,

    CONSTRAINT PK_Skills PRIMARY KEY (SkillId),
    CONSTRAINT FK_Skills_Users FOREIGN KEY (UserId)
        REFERENCES Users(Id) ON DELETE CASCADE
);
GO

-- --------------------------------------------------------------------
-- TABLE 4 : Education   (1 : N with Users)
-- EndDate is NULL when the course is still running.
-- --------------------------------------------------------------------
CREATE TABLE Education
(
    EducationId    INT IDENTITY(1,1) NOT NULL,
    UserId         INT               NOT NULL,
    Institution    NVARCHAR(150)     NOT NULL,
    Degree         NVARCHAR(100)     NOT NULL,
    FieldOfStudy   NVARCHAR(100)     NULL,
    StartDate      DATE              NULL,
    EndDate        DATE              NULL,
    Grade          NVARCHAR(50)      NULL,

    CONSTRAINT PK_Education PRIMARY KEY (EducationId),
    CONSTRAINT FK_Education_Users FOREIGN KEY (UserId)
        REFERENCES Users(Id) ON DELETE CASCADE
);
GO

-- --------------------------------------------------------------------
-- TABLE 5 : Experience   (1 : N with Users)
-- IsCurrent = 1 means the user still works there (EndDate stays NULL).
-- --------------------------------------------------------------------
CREATE TABLE Experience
(
    ExperienceId  INT IDENTITY(1,1) NOT NULL,
    UserId        INT               NOT NULL,
    CompanyName   NVARCHAR(150)     NOT NULL,
    JobTitle      NVARCHAR(100)     NOT NULL,
    StartDate     DATE              NULL,
    EndDate       DATE              NULL,
    IsCurrent     BIT               NOT NULL DEFAULT 0,
    Description   NVARCHAR(MAX)     NULL,

    CONSTRAINT PK_Experience PRIMARY KEY (ExperienceId),
    CONSTRAINT FK_Experience_Users FOREIGN KEY (UserId)
        REFERENCES Users(Id) ON DELETE CASCADE
);
GO


-- ====================================================================
-- STEP 3 : Sample data for testing / evaluation
-- Admin login : admin@resumeai.com / admin123
-- User login  : demo@resumeai.com  / demo123
-- ====================================================================

-- One Admin and one normal User
INSERT INTO Users (FullName, Email, Password, Role)
VALUES ('Admin', 'admin@resumeai.com', 'admin123', 'Admin');

INSERT INTO Users (FullName, Email, Password, Role)
VALUES ('Demo User', 'demo@resumeai.com', 'demo123', 'User');
GO

-- Career profile for Demo User (only one row allowed per user)
INSERT INTO CareerProfile (UserId, ProfessionalTitle, ProfessionalSummary, Phone, Location, LinkedInUrl, PortfolioUrl)
VALUES (
    (SELECT Id FROM Users WHERE Email = 'demo@resumeai.com'),
    'Junior Software Developer',
    'BCA student interested in web development using ASP.NET and SQL Server.',
    '9876543210',
    'Rajkot, Gujarat',
    'https://linkedin.com/in/demouser',
    'https://demouser.dev'
);
GO

-- Skills for Demo User
INSERT INTO Skills (UserId, SkillName, SkillCategory, SkillLevel)
VALUES ((SELECT Id FROM Users WHERE Email = 'demo@resumeai.com'), 'C#', 'Programming', 'Intermediate');

INSERT INTO Skills (UserId, SkillName, SkillCategory, SkillLevel)
VALUES ((SELECT Id FROM Users WHERE Email = 'demo@resumeai.com'), 'SQL Server', 'Database', 'Intermediate');

INSERT INTO Skills (UserId, SkillName, SkillCategory, SkillLevel)
VALUES ((SELECT Id FROM Users WHERE Email = 'demo@resumeai.com'), 'JavaScript', 'Programming', 'Beginner');
GO

-- Education for Demo User
INSERT INTO Education (UserId, Institution, Degree, FieldOfStudy, StartDate, EndDate, Grade)
VALUES ((SELECT Id FROM Users WHERE Email = 'demo@resumeai.com'), 'RK University', 'BCA', 'Computer Applications', '2023-07-01', NULL, '8.2 CGPA');

INSERT INTO Education (UserId, Institution, Degree, FieldOfStudy, StartDate, EndDate, Grade)
VALUES ((SELECT Id FROM Users WHERE Email = 'demo@resumeai.com'), 'City Higher Secondary School', '12th', 'Science', '2021-06-01', '2023-03-31', '78%');
GO

-- Experience for Demo User
INSERT INTO Experience (UserId, CompanyName, JobTitle, StartDate, EndDate, IsCurrent, Description)
VALUES ((SELECT Id FROM Users WHERE Email = 'demo@resumeai.com'), 'ABC Web Solutions', 'Web Development Intern', '2025-06-01', '2025-08-31', 0, 'Worked on ASP.NET Web Forms pages and SQL Server tables.');
GO


-- ====================================================================
-- STEP 4 : Check that everything was created (optional)
-- ====================================================================

SELECT * FROM Users;
SELECT * FROM CareerProfile;
SELECT * FROM Skills;
SELECT * FROM Education;
SELECT * FROM Experience;
GO
