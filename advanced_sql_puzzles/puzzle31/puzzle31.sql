SELECT 
    Value 
FROM (
SELECT 
    Value, 
    RANK() OVER(ORDER BY Value DESC) rank
FROM 
    "values"
)
WHERE
    rank == 2