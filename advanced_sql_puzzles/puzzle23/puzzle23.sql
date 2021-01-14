WITH average_scores AS (
SELECT
    AVG(score) AS avg
FROM
    scores
)

SELECT
    PlayerID,
    CASE
        WHEN Score > (SELECT avg FROM average_scores) THEN 1
        ELSE 2
    END AS Category
FROM
    scores