--Primer ejercicio
DECLARE
    nombre_empleado employees.first_name%TYPE;
BEGIN
    SELECT
        first_name
    INTO nombre_empleado
    FROM
        employees
    WHERE
        employee_id = 1000; --EMPLEADO INEXISTENTE
    dbms_output.put_line(nombre_empleado);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe el empleado.');
END;

--Segundo Ejercicio
DECLARE
    nombre_empleado employees.first_name%TYPE;
BEGIN
    SELECT
        first_name
    INTO nombre_empleado
    FROM
        employees
    WHERE
        employee_id = 1000;

    dbms_output.put_line(nombre_empleado);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe el empleado.');
    WHEN too_many_rows THEN
        dbms_output.put_line('Empleado duplicado.');
END;
 
 --Tercer Ejercicio
DECLARE
    nombre_empleado employees.first_name%TYPE;
    salario         NUMBER;
BEGIN
    SELECT
        salary
    INTO salario
    FROM
        employees
    WHERE
        employee_id = 100;

    salario := salario / 0;
    dbms_output.put_line(salario);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe el empleado.');
    WHEN too_many_rows THEN
        dbms_output.put_line('Empleado duplicado.');
    WHEN OTHERS THEN
        dbms_output.put_line('CODIGO:' || sqlcode);
        dbms_output.put_line('MENSAJE:' || sqlerrm);
END;

--Cuarto Ejercicio
set serveroutput on

DECLARE
    duplicado EXCEPTION;
    PRAGMA exception_init ( duplicado, -00001 );
BEGIN
    INSERT INTO regions VALUES (
        1,
        'PRUEBA'
    );

    COMMIT;
EXCEPTION
    WHEN duplicado THEN
        dbms_output.put_line('Registro duplicado');
END;