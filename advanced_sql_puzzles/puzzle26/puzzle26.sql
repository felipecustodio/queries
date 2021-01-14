WITH one_year_ago AS (
    SELECT
        SUM(Amount) AS total
    FROM
        sales
    WHERE
        Year == (SELECT MAX(Year) FROM sales) - 1
    GROUP BY
        Year
),

two_years_ago AS (
    SELECT
        SUM(Amount) AS total
    FROM
        sales
    WHERE
        Year == (SELECT MAX(Year) FROM sales) - 2
    GROUP BY
        Year
)


SELECT
    (SELECT SUM(Amount) FROM sales WHERE Year == (SELECT MAX(Year) FROM sales)) AS "2018",
    (SELECT total FROM one_year_ago) AS "2017",
    (SELECT total FROM two_years_ago) AS "2016"
FROM
    sales
GROUP BY
    1