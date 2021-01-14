WITH ids AS (
SELECT
    Distributor,
    Facility,
    Zone,
    ROW_NUMBER() OVER(ORDER BY OrderID) AS CriteriaID
FROM
    orders
GROUP BY
    Distributor,
    Facility,
    Zone
)

SELECT
    ids.CriteriaID,
    orders.OrderID,
    orders.Distributor,
    orders.Facility,
    orders.Zone,
    orders.Amount
FROM
    orders
LEFT JOIN
    ids
USING
    (Distributor, Facility, Zone)