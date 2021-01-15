SELECT
    Candidate
FROM
    candidates
JOIN
    requirements
ON 
    candidates.Description == requirements.Description
GROUP BY
    Candidate
HAVING
    COUNT(candidates.Description) == (SELECT COUNT(Description) FROM requirements)