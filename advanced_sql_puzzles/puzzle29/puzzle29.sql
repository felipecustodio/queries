WITH steps_previous AS (

SELECT 
    StepNumber,
    Status,
    LAG(Status) OVER (ORDER BY StepNumber) AS Previous
FROM 
    steps

),

steps_marked AS (

SELECT
    StepNumber current_step,
    Status,
    CASE
        WHEN Previous <> Status THEN NULL
        WHEN Previous ISNULL THEN 1
        ELSE 1
    END tag
FROM
    steps_previous

),

steps_sum AS (

SELECT
    *,
    CASE
        WHEN tag ISNULL THEN -SUM(tag) OVER(ORDER BY current_step)
        ELSE 1
    END AS sum_tag
FROM
    steps_marked

)

SELECT
    current_step,
    Status,
    SUM(sum_tag) OVER(ORDER BY current_step)
FROM 
    steps_sum