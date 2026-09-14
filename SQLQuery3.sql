USE DWH;
GO

CREATE TABLE DimBranch (
    BranchID INT NOT NULL,
    BranchName VARCHAR(50) NULL,
    BranchLocation VARCHAR(50) NULL,

    CONSTRAINT PK_DimBranch PRIMARY KEY (BranchID)
);
GO