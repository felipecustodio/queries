WITH days AS (SELECT
    Workflow,
    CAST(SUBSTR(ExecutionDate, 4, 2) AS INTEGER) AS day
FROM
    workflows)

SELECT
    Workflow,
    CAST(AVG(days_between) AS INTEGER) AS AverageDays
FROM
    (
        SELECT
            Workflow,
            COALESCE(day - LAG(day) OVER(PARTITION BY Workflow ORDER BY day ASC), 0) AS days_between
        FROM
            days
    )
WHERE
    days_between <> 0
GROUP BY
    Workflow