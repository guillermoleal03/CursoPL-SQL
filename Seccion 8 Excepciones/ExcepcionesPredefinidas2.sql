SET SERVEROUTPUT ON

DECLARE
    empl employees%rowtype;
BEGIN
    SELECT
        *
    INTO empl
    FROM
        employees
    WHERE
        employee_id > 1;

    dbms_output.put_line(empl.first_name);
EXCEPTION
-- NO_DATA_FOUND   ORA-01403
-- TOO_MANY_ROWS
-- ZERO_DIVIDE
-- DUP_VAL_ON_INDEX
    WHEN no_data_found THEN
        dbms_output.put_line('ERROR, EMPLEADO INEXISTENTE');
    WHEN too_many_rows THEN
        dbms_output.put_line('ERROR, DEMASIADOS EMPLEADO');
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR INDEFINIDO');
END;