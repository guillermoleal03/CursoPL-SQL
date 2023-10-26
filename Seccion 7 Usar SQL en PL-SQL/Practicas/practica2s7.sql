--Ejercicio 1 
DECLARE
    max_id NUMBER;
BEGIN
    SELECT
        MAX(department_id)
    INTO max_id
    FROM
        departments;

    max_id := max_id + 1;
    INSERT INTO departments (
        department_id,
        department_name,
        manager_id,
        location_id
    ) VALUES (
        max_id,
        'INFORMATICA',
        100,
        1000
    );

    COMMIT;
END;

--Ejercicio 2

BEGIN
    UPDATE departments
    SET
        location_id = 1700
    WHERE
        department_name = 'INFORMATICA';

    COMMIT;
END;

--Ejercicio 3
BEGIN
    DELETE departments
    WHERE
        department_name = 'INFORMATICA';

    COMMIT;
END;