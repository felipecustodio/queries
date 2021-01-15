SELECT
    Workflow
FROM
    workflows
GROUP BY
    Workflow
HAVING
    COUNT(CompletionDate) < COUNT(StepNumber)
