WITH averages AS (
SELECT
    State,
    CAST(SUBSTR(OrderDate, 1, 2) AS INTEGER) AS month,
    AVG(Amount) AS average_value
FROM
    sales
GROUP BY
    State,
    month
)

SELECT
    State
FROM
    averages
GROUP BY
    State
HAVING
    SUM(average_value) / COUNT(month) >= 100