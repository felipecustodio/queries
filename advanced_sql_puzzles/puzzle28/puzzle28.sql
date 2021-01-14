SELECT
  RowNumber, 
  Workflow, 
  Status, 
  FIRST_VALUE(Workflow) OVER (PARTITION BY workflow_partition ORDER BY RowNumber),
  workflow_partition
FROM (
  SELECT
    RowNumber,
    Workflow,
    Status,
    SUM(CASE WHEN Workflow IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY RowNumber) AS workflow_partition
  FROM
    workflows
  ORDER BY 
    RowNumber ASC
)