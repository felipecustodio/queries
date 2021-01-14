WITH checks AS (
    SELECT
        a.Number NumberA,
        b.Number NumberB,
        CASE 
            WHEN a.Number > 2 AND b.Number >= 2 AND a.Number <> b.Number THEN a.Number % b.Number == 0
            ELSE 0
        END divisors
    FROM
        numbers a
    LEFT JOIN
        numbers b
    ON
        b.Number <= a.Number
)

SELECT
    NumberA
FROM
    checks
GROUP BY
    NumberA
HAVING
    SUM(Divisors) == 0
