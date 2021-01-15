WITH 

Cellular AS (
    SELECT
        Customer,
        Phone
    FROM
        Phones
    WHERE
        Type == "Cellular"
),

Work AS (
    SELECT
        Customer,
        Phone
    FROM
        Phones
    WHERE
        Type == "Work"
),

Home AS (
    SELECT
        Customer,
        Phone
    FROM
        Phones
    WHERE
        Type == "Home"
)

SELECT
    Phones.Customer,
    COALESCE(Cellular.Phone, " ") AS Cellular,
    COALESCE(Work.Phone, " ") AS Work,
    COALESCE(Home.Phone, " ") AS Home
FROM
    Phones
LEFT JOIN
    Cellular
ON
    Phones.Customer == Cellular.Customer
LEFT JOIN
    Work
ON
    Phones.Customer == Work.Customer
LEFT JOIN
    Home
ON
    Phones.Customer == Home.Customer
GROUP BY
    Phones.Customer
