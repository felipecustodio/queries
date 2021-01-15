WITH ConcatenatedEmployees AS (
    SELECT
        Employee,
        GROUP_CONCAT(License) AS Licenses
    FROM
        employees
    GROUP BY
        Employee
)

SELECT
    a.Employee
FROM
    ConcatenatedEmployees a
JOIN
    ConcatenatedEmployees b
ON
    a.Licenses == b.Licenses
    AND a.Employee <> b.Employee
GROUP BY
    a.Employee