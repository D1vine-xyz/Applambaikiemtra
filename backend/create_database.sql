-- ============================================================
--  TOEIC Reading Exam - Database schema (SQL Server)
--  Tuong ung voi file Tags_va_CSDL_ThietKe.md (Phan B)
--  Chay truoc khi import de thi.
-- ============================================================

-- Drop theo thu tu phu thuoc (con truoc, cha sau)
IF OBJECT_ID('dbo.StudentAnswer', 'U') IS NOT NULL DROP TABLE dbo.StudentAnswer;
IF OBJECT_ID('dbo.ExamAttempt',    'U') IS NOT NULL DROP TABLE dbo.ExamAttempt;
IF OBJECT_ID('dbo.AnswerOption',   'U') IS NOT NULL DROP TABLE dbo.AnswerOption;
IF OBJECT_ID('dbo.Question',       'U') IS NOT NULL DROP TABLE dbo.Question;
IF OBJECT_ID('dbo.QuestionGroup',  'U') IS NOT NULL DROP TABLE dbo.QuestionGroup;
IF OBJECT_ID('dbo.Exam',           'U') IS NOT NULL DROP TABLE dbo.Exam;
GO

-- 1. De thi ----------------------------------------------------
CREATE TABLE dbo.Exam (
    Id               INT IDENTITY(1,1) PRIMARY KEY,
    Title            NVARCHAR(200)  NOT NULL,               -- [EXAM:TITLE]
    TimeLimitMinutes INT            NOT NULL DEFAULT 75,    -- [EXAM:TIME]
    IsPublished      BIT            NOT NULL DEFAULT 0,     -- giang vien xuat ban moi duoc thi
    CreatedAt        DATETIME2      NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

-- 2. Nhom bai doc (Part 6/7). Part 5: dung GroupId NULL tren Question. --
CREATE TABLE dbo.QuestionGroup (
    Id               INT IDENTITY(1,1) PRIMARY KEY,
    ExamId           INT           NOT NULL
        CONSTRAINT FK_QuestionGroup_Exam FOREIGN KEY REFERENCES dbo.Exam(Id),
    Part             INT           NOT NULL CONSTRAINT CK_QuestionGroup_Part CHECK (Part IN (5,6,7)),
    PassageText      NVARCHAR(MAX) NULL,                    -- [PASSAGE] (da thay [GAP:n] bang placeholder)
    OrderIndex       INT           NOT NULL DEFAULT 0,      -- thu tu hien thi / hoan vi
    ShuffleQuestions BIT           NOT NULL DEFAULT 0       -- [SHUFFLE_Q] cua nhom
);
GO

-- 3. Cau hoi ---------------------------------------------------
CREATE TABLE dbo.Question (
    Id               INT IDENTITY(1,1) PRIMARY KEY,
    ExamId           INT           NOT NULL
        CONSTRAINT FK_Question_Exam   FOREIGN KEY REFERENCES dbo.Exam(Id),
    GroupId          INT           NULL                       -- NULL neu Part 5 doc lap
        CONSTRAINT FK_Question_Group  FOREIGN KEY REFERENCES dbo.QuestionGroup(Id),
    Part             INT           NOT NULL CONSTRAINT CK_Question_Part CHECK (Part IN (5,6,7)),
    QuestionNumber   INT           NOT NULL,                  -- 101..200
    StemText         NVARCHAR(MAX) NULL,                      -- [QTEXT] (Part 6 de NULL, dung GapPosition)
    GapPosition      INT           NULL,                      -- Part 6: vi tri cho trong trong PassageText
    CorrectOptionKey CHAR(1)       NOT NULL CONSTRAINT CK_Question_Key CHECK (CorrectOptionKey IN ('A','B','C','D')),
    Hint             NVARCHAR(MAX) NULL,                      -- [HINT]
    ShuffleAnswers   BIT           NOT NULL DEFAULT 0,        -- [SHUFFLE_A]
    OrderIndex       INT           NOT NULL DEFAULT 0,
    CONSTRAINT UQ_Question_Number UNIQUE (ExamId, QuestionNumber)
);
GO

-- 4. Dap an cua tung cau ----------------------------------------
CREATE TABLE dbo.AnswerOption (
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    QuestionId  INT           NOT NULL
        CONSTRAINT FK_AnswerOption_Question FOREIGN KEY REFERENCES dbo.Question(Id),
    OptionKey   CHAR(1)       NOT NULL CONSTRAINT CK_AnswerOption_Key CHECK (OptionKey IN ('A','B','C','D')),
    OptionText  NVARCHAR(MAX) NOT NULL,
    OrderIndex  INT           NOT NULL DEFAULT 0               -- dung de hoan vi dap an
);
GO

-- 5. Luot lam bai -----------------------------------------------
CREATE TABLE dbo.ExamAttempt (
    Id        INT IDENTITY(1,1) PRIMARY KEY,
    ExamId    INT           NOT NULL
        CONSTRAINT FK_ExamAttempt_Exam FOREIGN KEY REFERENCES dbo.Exam(Id),
    StudentId NVARCHAR(128) NOT NULL,
    StartTime DATETIME2     NOT NULL DEFAULT SYSUTCDATETIME(),
    EndTime   DATETIME2     NULL,                              -- NULL khi chua nop
    Score     INT           NULL                               -- tinh khi cham
);
GO

-- 6. Cau tra loi cua thi sinh ------------------------------------
CREATE TABLE dbo.StudentAnswer (
    Id          INT IDENTITY(1,1) PRIMARY KEY,
    AttemptId   INT      NOT NULL
        CONSTRAINT FK_StudentAnswer_Attempt  FOREIGN KEY REFERENCES dbo.ExamAttempt(Id),
    QuestionId  INT      NOT NULL
        CONSTRAINT FK_StudentAnswer_Question FOREIGN KEY REFERENCES dbo.Question(Id),
    SelectedKey CHAR(1)  NULL,                                 -- NULL = bo qua
    AnsweredAt  DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

-- Chi muc ho tro tra cuu
CREATE INDEX IX_Question_GroupId ON dbo.Question(GroupId);
CREATE INDEX IX_Question_ExamId  ON dbo.Question(ExamId);
CREATE INDEX IX_AnswerOption_QuestionId ON dbo.AnswerOption(QuestionId);
CREATE INDEX IX_StudentAnswer_AttemptId  ON dbo.StudentAnswer(AttemptId);
GO

-- ============================================================
--  Cham diem tu dong (vi du)
-- ============================================================
-- Tong cau dung cua 1 luot thi:
--   SELECT COUNT(*)
--   FROM dbo.StudentAnswer sa
--   JOIN dbo.Question q ON q.Id = sa.QuestionId
--   WHERE sa.AttemptId = @attemptId AND sa.SelectedKey = q.CorrectOptionKey;
--
-- Cau bo qua:  SelectedKey IS NULL
-- Cau sai:     SelectedKey <> CorrectOptionKey
