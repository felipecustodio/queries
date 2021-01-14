WITH counts AS (
SELECT 
    JobDescription,
    MAX(MissionCount) max,
    MIN(MissionCount) min
FROM 
    missions
GROUP BY
    JobDescription
)

SELECT
    most.JobDescription,
    most."Most Experienced",
    least."Least Experienced"
FROM (
SELECT
    m.JobDescription,
    m.SpacemanID "Most Experienced"
FROM
    missions m
JOIN
    counts c
ON
    m.MissionCount == c.max
) most
LEFT JOIN (
SELECT
    m.JobDescription,
    m.SpacemanID "Least Experienced"
FROM
    missions m
JOIN
    counts c
ON
    m.MissionCount == c.min
) least
ON
    most.JobDescription == least.JobDescription