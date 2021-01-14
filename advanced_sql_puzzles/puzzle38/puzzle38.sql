SELECT
    DISTINCT a.Region,
    a.Distributor,
    0 AS Sales
FROM
    sales a
CROSS JOIN
    sales b

-- FULL OUTER JOIN: Generate all combinations of Region and Distributor,
-- with 0 as Sales
-- LEFT JOIN, COALESCE Sales