SELECT
    *
FROM
    orders
WHERE
    Customer IN (
        SELECT
            Customer
        FROM
            orders
        WHERE
            DeliveryState == "CA"
    )
    AND DeliveryState == "TX"