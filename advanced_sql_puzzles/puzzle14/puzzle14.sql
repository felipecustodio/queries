WITH workflow_statuses AS (
SELECT
    Workflow,
    GROUP_CONCAT(Status) AS statuses
FROM
    workflows
GROUP BY
    Workflow
)

SELECT
    Workflow,
    CASE
        WHEN statuses LIKE "%Error%" THEN
            (
                CASE 
                    WHEN statuses LIKE "%Complete%" THEN "Indeterminate"
                    WHEN statuses LIKE "%Running%" THEN "Indeterminate"
                    ELSE "Error"
                END
            )
        WHEN statuses LIKE "%Complete%" THEN
            (
                CASE 
                    WHEN statuses LIKE "%Running%" THEN "Running"
                    ELSE "Complete"
                END
            )
    END Status
FROM
    workflow_statuses
