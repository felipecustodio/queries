-- This works for the toy example,
-- but I believe the challenge is
-- generating permutations for N rows
SELECT
    a.Letter,
    b.Letter,
    c.Letter
FROM
    letters a
JOIN
    letters b
JOIN   
    letters c
WHERE
    a.Letter <> b.Letter
    AND a.Letter <> c.Letter
    AND b.Letter <> c.Letter