SELECT 
    SalesRepID
FROM (
    SELECT
        SalesRepID,
        COUNT(DISTINCT SalesType) AS types
    FROM
        sales
    GROUP BY
        SalesRepID
)
WHERE
    types == 1