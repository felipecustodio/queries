WITH time AS (
SELECT
    Product,
    MAX(Days) max
FROM
    manufacturing
GROUP BY
    Product
)

SELECT
    d.OrderID,
    d.Product
FROM
    deliveries d
JOIN
    time t
WHERE
    t.max <= d.DeliveryDate
GROUP BY
    d.OrderID,
    d.Product
ORDER BY
    d.OrderID ASC