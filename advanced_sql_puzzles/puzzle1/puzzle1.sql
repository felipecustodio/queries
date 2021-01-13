WITH males AS (SELECT
    id AS male_id,
    ROW_NUMBER() OVER(ORDER BY id ASC) AS row_number
FROM
    students
WHERE
    gender = "M"),

females AS (SELECT
    id AS female_id,
    ROW_NUMBER() OVER(ORDER BY id ASC) AS row_number
FROM
    students
WHERE
    gender = "F"
)

SELECT
    male_id,
    female_id
FROM
    females
FULL OUTER JOIN
    males
ON 
    females.row_number == males.row_number