WITH parsed_periods AS (
SELECT
    StartDate,
    CAST(SUBSTR(StartDate, 4, 2) AS INTEGER) AS StartDay,
    EndDate,
    CAST(SUBSTR(EndDate, 4, 2) AS INTEGER) AS EndDay
FROM
    periods
)

SELECT
    StartDay,
    EndDay,
    LEAD(StartDay, 1) OVER(ORDER BY StartDay) AS StartDay1,
    LEAD(EndDay, 1) OVER(ORDER BY StartDay) AS EndDay1,
    LEAD(StartDay, 2) OVER(ORDER BY StartDay) AS StartDay2,
    LEAD(EndDay, 2) OVER(ORDER BY StartDay) AS EndDay2
FROM
    parsed_periods