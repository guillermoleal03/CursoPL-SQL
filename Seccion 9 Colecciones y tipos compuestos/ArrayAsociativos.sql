SET SERVEROUTPUT ON

DECLARE
    TYPE departamentos IS
        TABLE OF departments.department_name%TYPE INDEX BY PLS_INTEGER;
    TYPE empleados IS
        TABLE OF employees%rowtype INDEX BY PLS_INTEGER;
    depts  departamentos;
    emples empleados;
BEGIN
--TIPO SIMPLE
    depts(1) := 'INFORMATICA';
    depts(2) := 'AZZZ';
    dbms_output.put_line(depts(1));
    dbms_output.put_line(depts(2));
    dbms_output.put_line(depts.last);
    dbms_output.put_line(depts.first);
    IF depts.EXISTS(3) THEN
        dbms_output.put_line(depts(3));
    ELSE
        dbms_output.put_line('EL VALOR NO EXISTE');
    END IF;
--TIPO COMPUESTO
    SELECT
        *
    INTO
        emples
    (1)
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(emples(1).first_name);
    SELECT
        *
    INTO
        emples
    (2)
    FROM
        employees
    WHERE
        employee_id = 110;

    dbms_output.put_line(emples(1).first_name);
    dbms_output.put_line(emples(2).first_name);
END;