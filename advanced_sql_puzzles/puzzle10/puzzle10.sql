-- WITH number_count AS (
--     SELECT
--         Number,
--         COUNT(Number) Occurrences
--     FROM
--         numbers
--     GROUP BY
--         Number
-- )

-- SELECT
--     AVG(Number) AS Mean,
--     (
--         SELECT
--             Number
--         FROM
--             number_count
--         WHERE
--             Occurrences == (SELECT MAX(Occurrences) FROM number_count)
--         GROUP BY
--             Number
--     ) Mode,

--     (
--         SELECT
--             Number,
--             ROW_NUMBER() OVER(ORDER BY numbers)
--         FROM
--             numbers
--     )


--     MAX(Number) - MIN(Number) Range,


-- FROM
--     numbers

WITH NumberRows AS (SELECT
    Number,
    ROW_NUMBER() OVER(ORDER BY Number) AS row
FROM
    numbers)

SELECT
    CASE
        WHEN (MAX(row) % 2 == 0) THEN "Even"
        ELSE "Odd"
    END
FROM
    NumberRows