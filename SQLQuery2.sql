USE DWH;
GO

CREATE TABLE DimCustomer (
    CustomerID INT NOT NULL,
    CustomerName VARCHAR(50) NULL,
    Address VARCHAR(MAX) NULL,
    CityName VARCHAR(50) NULL,
    StateName VARCHAR(50) NULL,
    Age VARCHAR(3) NULL,
    Gender VARCHAR(10) NULL,
    Email VARCHAR(50) NULL,

    CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerID)
);
GO