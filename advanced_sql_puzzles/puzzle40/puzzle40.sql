-- Turns out this isn't a 'puzzle'. =/
-- The solution is a CASE WHEN...
SELECT
    City,
    LENGTH(City) - LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
        LOWER(City), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', '')) AS vowels,
    LENGTH(City) - (LENGTH(City) - LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
        LOWER(City), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', ''))) AS consonants,
    SUBSTR(City, 2, 1) AS second_letter
FROM
    cities
ORDER BY
    second_letter ASC,
    consonants DESC,
    vowels DESC