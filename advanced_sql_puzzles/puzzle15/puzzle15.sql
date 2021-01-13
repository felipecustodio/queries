WITH tokenized AS (SELECT
    Syntax token,
    LAG(Syntax) OVER (ORDER BY Sequence) previous_token,
    LEAD(Syntax) OVER (ORDER BY Sequence) next_token
FROM
    syntax)
