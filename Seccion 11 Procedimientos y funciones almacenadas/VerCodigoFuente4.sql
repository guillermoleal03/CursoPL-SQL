--USER_OBJECTS
SELECT
    *
FROM
    user_objects
WHERE
    object_type = 'PROCEDURE';

SELECT
    object_type,
    COUNT(*)
FROM
    user_objects
GROUP BY
    object_type;

SELECT
    *
FROM
    user_source
WHERE
    name = 'PR1';

SELECT
    text
FROM
    user_source
WHERE
    name = 'PR1';