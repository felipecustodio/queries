-- What are my tables?
-- SELECT 
--     *
-- FROM 
--     sqlite_master
-- WHERE 
--     type = 'table'

-- Get crime report
-- SELECT
--     *
-- FROM
--     crime_scene_report
-- WHERE
--     type = "murder" 
--     AND city = "SQL City" 
--     AND date = "20180115"

-- Second Witness
-- SELECT
--     *
-- FROM
--     person
-- WHERE
--     name LIKE "%Annabel%"
--     AND address_street_name == "Franklin Ave"

-- First Witness
-- SELECT
--     *
-- FROM
--     person
-- WHERE
--     address_number IN (
--         SELECT 
--             MAX(address_number)
--         FROM
--             person
--         WHERE
--             address_street_name == "Northwestern Dr"
--         )

-- Interviews with the witnesses
-- SELECT
--     *
-- FROM
--     interview
-- WHERE
--     person_id IN (14887, 16371)

-- Gym members based on interview description
-- SELECT
--     *
-- FROM
--     get_fit_now_member
-- WHERE
--     id LIKE "48Z%" 
--     AND membership_status == "gold"

-- Possible owners of cars based on interview description
-- SELECT 
--     *
-- FROM
--     drivers_license
-- WHERE
--     plate_number LIKE "%H42W%"
--     AND gender == "male"

-- Gym checkin
-- SELECT
--     *
-- FROM
--     get_fit_now_check_in
-- WHERE
--     check_in_date == "20180109"
--     AND membership_id IN ("48Z7A", "48Z55")

-- SELECT
--     person_id,
--     event_name,
--     date
-- FROM
--     facebook_event_checkin
-- WHERE
--     -- person_id IN (28819, 673118, 423327, 664760)
--     person_id IN (14887, 16371)

-- SELECT
--     *
-- FROM
--     get_fit_now_member
-- WHERE
--     person_id IN (14887, 16371)

-- SELECT
--     *
-- FROM
--     get_fit_now_check_in
-- WHERE
--     membership_id == "90081"

-- SELECT
--     *
-- FROM
--     get_fit_now_check_in
-- WHERE
--     check_out_time >= 1600

-- SELECT
--     *
-- FROM
--     facebook_event_checkin
-- WHERE
--     person_id IN (28819, 67318)

-- SELECT * FROM (SELECT  
--     *
-- FROM
--     drivers_license
-- WHERE
--     id IN (423327, 664760)) AS possible_getaway_drivers
-- JOIN
--     person
-- ON
--     possible_getaway_drivers.id == person.license_id

-- SELECT
--     *
-- FROM
--     interview
-- WHERE
--     person_id == 67318

-- SELECT
--     *
-- FROM
--     drivers_license
-- WHERE
--     gender == "female"

SELECT
    *
FROM
    drivers_license
JOIN
    person
ON
    drivers_license.id == person.license_id
JOIN
    income
ON
    person.ssn == income.ssn
JOIN
    facebook_event_checkin
ON
    facebook_event_checkin.person_id == person.id
WHERE
    gender == "female"
    AND hair_color == "red"
    AND car_make == "Tesla"
    AND car_model == "Model S"
    AND height BETWEEN 65 AND 66
    AND event_name LIKE "%SQL%"