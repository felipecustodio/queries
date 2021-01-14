-- A = CustomerID==1001
-- B = Amount==50
-- NOT (A AND B)
-- NOT A OR NOT B
SELECT
    *
FROM
    orders
WHERE
    CustomerID <> 1001
    OR Amount <> 50