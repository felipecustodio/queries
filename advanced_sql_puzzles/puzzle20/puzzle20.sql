SELECT
    ProductID,
    EffectiveDate,
    UnitPrice
FROM
    prices
GROUP BY
    ProductID
HAVING
    EffectiveDate == MAX(EffectiveDate)