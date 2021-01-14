WITH total_orders AS (
SELECT
    CustomerID,
    Vendor,
    SUM(OrderCount) AS total
FROM
    orders
GROUP BY
    CustomerID,
    Vendor
)

SELECT
    CustomerID,
    Vendor,
    MAX(total) AS most_orders
FROM
    total_orders
GROUP BY
    CustomerID
