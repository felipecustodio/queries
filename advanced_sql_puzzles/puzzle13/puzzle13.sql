SELECT
    Date,
    QuantityAdjustment,
    SUM(QuantityAdjustment) OVER (ORDER BY Date)
FROM
    inventory
ORDER BY
    date ASC