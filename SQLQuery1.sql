USE DWH;
GO

CREATE TABLE DimAccount (
    AccountID INT NOT NULL,
    CustomerID INT NULL,
    AccountType VARCHAR(10) NULL,
    Balance INT NULL,
    DateOpened DATETIME2(0) NULL,
    Status VARCHAR(10) NULL,

    CONSTRAINT PK_DimAccount PRIMARY KEY (AccountID)
);
GO