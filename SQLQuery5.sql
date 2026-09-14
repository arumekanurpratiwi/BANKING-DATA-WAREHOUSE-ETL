USE DWH;
GO

CREATE TABLE FactTransaction (
    TransactionID INT NOT NULL,
    AccountID INT NOT NULL,
    TransactionDate DATETIME2(0) NOT NULL,
    Amount INT NOT NULL,
    TransactionType VARCHAR(50) NOT NULL,
    BranchID INT NOT NULL,

    CONSTRAINT PK_FactTransaction PRIMARY KEY (TransactionID),

    CONSTRAINT FK_FactTransaction_Account
        FOREIGN KEY (AccountID)
        REFERENCES DimAccount (AccountID),

    CONSTRAINT FK_FactTransaction_Branch
        FOREIGN KEY (BranchID)
        REFERENCES DimBranch (BranchID)
);
GO