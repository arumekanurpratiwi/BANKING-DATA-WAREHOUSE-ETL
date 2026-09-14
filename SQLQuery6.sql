USE DWH;
GO

CREATE PROCEDURE DailyTransaction
    @start_date DATE,
    @end_date DATE
AS
BEGIN
    SELECT
        CAST(TransactionDate AS DATE) AS [Date],
        COUNT(TransactionID) AS TotalTransactions,
        SUM(Amount) AS TotalAmount
    FROM FactTransaction
    WHERE TransactionDate >= @start_date
      AND TransactionDate < DATEADD(DAY, 1, @end_date)
    GROUP BY CAST(TransactionDate AS DATE)
    ORDER BY [Date];
END;
GO

EXEC DailyTransaction
    @start_date = '2024-01-17',
    @end_date = '2024-01-22';