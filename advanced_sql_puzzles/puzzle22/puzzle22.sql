WITH max_occurrences AS (
SELECT
    Message,
    MAX(Occurrences) AS max
FROM
    workflows
GROUP BY
    Message
)

SELECT
    w.Workflow,
    w.Message
FROM
    workflows w
JOIN
    max_occurrences m
ON
    Occurrences == max
ORDER BY
    w.Workflow ASC