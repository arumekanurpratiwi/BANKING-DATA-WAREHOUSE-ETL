USE DWH;
GO

CREATE OR ALTER PROCEDURE BalancePerCustomer
    @name VARCHAR(50)
AS
BEGIN

    SELECT
        c.CustomerName AS CustomerName,
        a.AccountType AS AccountType,
        a.Balance AS Balance,

        a.Balance
        + COALESCE(
            SUM(
                CASE
                    WHEN f.TransactionType = 'Deposit'
                        THEN f.Amount
                    ELSE -f.Amount
                END
            ), 0
        ) AS CurrentBalance

    FROM DimAccount a

    INNER JOIN DimCustomer c
        ON a.CustomerID = c.CustomerID

    LEFT JOIN FactTransaction f
        ON a.AccountID = f.AccountID

    WHERE
        a.Status = 'Active'
        AND c.CustomerName LIKE '%' + @name + '%'

    GROUP BY
        c.CustomerName,
        a.AccountType,
        a.Balance;

END;
GO

EXEC BalancePerCustomer
    @name = 'Shelly';