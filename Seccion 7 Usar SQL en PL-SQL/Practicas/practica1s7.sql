--Primer ejercicio
SET SERVEROUTPUT ON

DECLARE
    salario_maximo employees.salary%TYPE;
BEGIN
    SELECT
        MAX(salary)
    INTO salario_maximo
    FROM
        employees
    WHERE
        department_id = 100;

    dbms_output.put_line('el salario máximo de ese departamento 
es:' || salario_maximo);
END;

--SEGUNDO EJERCICIO
DECLARE
    tipo_trabajo employees.job_id%TYPE;
BEGIN
    SELECT
        job_id
    INTO tipo_trabajo
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line('El tipo de trabajo del empleado 100 
es:' || tipo_trabajo);
END;

--TERCER EJERCICIO
set serveroutput on

DECLARE
    cod_departamento departments.department_id%TYPE := 10;
    nom_departamento departments.department_name%TYPE;
    num_emple        NUMBER;
BEGIN
 --RECUPERAR EL NOMBRE DEL DEPARTAMENTO
    SELECT
        department_name
    INTO nom_departamento
    FROM
        departments
    WHERE
        department_id = cod_departamento;
 --RECUPERAR EL NÚMERO DE EMLEADOS DEL DEPARTAMENTO
    SELECT
        COUNT(*)
    INTO num_emple
    FROM
        employees
    WHERE
        department_id = cod_departamento;

    dbms_output.put_line('EL DEPARTAMENTO 
'
                         || nom_departamento
                         || ' TIENE '
                         || num_emple
                         || ' EMPLEADOS');

END;


--CUARTO EJERCICIO
DECLARE
    maximo     NUMBER;
    minimo     NUMBER;
    diferencia NUMBER;
BEGIN
    SELECT
        MAX(salary),
        MIN(salary)
    INTO
        maximo,
        minimo
    FROM
        employees;

    dbms_output.put_line('EL SALARIO MÁXIMO ES:' || maximo);
    dbms_output.put_line('EL SALARIO MÍNIMO ES:' || minimo);
    diferencia := maximo - minimo;
    dbms_output.put_line('LA DIFERENCIA ES:' || diferencia);
END;