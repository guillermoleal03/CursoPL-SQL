SET SERVEROUTPUT ON

DECLARE
    TYPE empl_record IS RECORD (
            name     VARCHAR2(100),
            sal      employees.salary%TYPE,
            cod_dept employees.department_id%TYPE
    );
    TYPE empl_table IS
        TABLE OF empl_record INDEX BY PLS_INTEGER;
    empl empl_table;
BEGIN
    FOR i IN 100..206 LOOP
        SELECT
            first_name
            || ' '
            || last_name,
            salary,
            department_id
        INTO
            empl
        (i)
        FROM
            employees
        WHERE
            employee_id = i;

    END LOOP;

    FOR i IN empl.first..empl.last LOOP
        dbms_output.put_line(empl(i).name
                             || ' '
                             || empl(i).sal
                             || ' 
'
                             || empl(i).cod_dept);
    END LOOP;

    dbms_output.put_line('EL PRIMERO');
    dbms_output.put_line(empl(empl.first).name);
    dbms_output.put_line('EL ÚLTIMO');
    dbms_output.put_line(empl(empl.last).name);
    dbms_output.put_line('BORRAMOS LOS EMPLEADOS QUE GANEN 
MENOS DE 7000');
    dbms_output.put_line('ANTES');
    dbms_output.put_line(empl.count);
    FOR i IN empl.first..empl.last LOOP
        IF empl(i).sal < 7000 THEN
            empl.DELETE(i);
        END IF;
    END LOOP;

    dbms_output.put_line('DESPUES');
    dbms_output.put_line(empl.count);
END;