--Punto 1

CREATE OR REPLACE FUNCTION slarios_dept (
    dep NUMBER
) RETURN NUMBER IS
    salary    NUMBER;
    depart    hr.departments.department_id%TYPE;
    num_emple NUMBER;
BEGIN
    SELECT
        department_id
    INTO depart
    FROM
        hr.departments
    WHERE
        department_id = dep;

    SELECT
        COUNT(*)
    INTO num_emple
    FROM
        hr.employees
    WHERE
        department_id = dep;

    IF dep > 0 THEN
        SELECT
            SUM(salary)
        INTO salary
        FROM
            hr.employees
        WHERE
            department_id = dep
        GROUP BY
            department_id;

    ELSE
        raise_application_error(-20730, 'El departamento existe, pero no hay 
empleados ' || dep);
    END IF;

    RETURN salary;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20730, 'No existe 
el departamento ' || dep);
END;
--Probar la función
SET SERVEROUTPUT ON

DECLARE
    sal  NUMBER;
    dept NUMBER := 100;
BEGIN
    sal := salarios_dept(dept);
    dbms_output.put_line('El salario total del departamento '
                         || dept
                         || ' es: '
                         || sal);
END;

--Punto 2

CREATE OR REPLACE FUNCTION salarios_dept1(dep_id NUMBER, 
n_empleados OUT NUMBER) RETURN NUMBER
IS
sal NUMBER;
BEGIN
--COMPROBAR QUE EL DEPARTAMENTO EXISTE. SI NO 
EXISTE SE DISPARA LA EXCEPCIÓN
 SELECT DEPARTMENT_ID INTO DEPT FROM DEPARTMENTS 
WHERE DEPARTMENT_ID=DEP_ID;
--SI EL DEPARTAMENTO EXISTE CALCULAR TOTALES
SELECT sum(salary),count(salary) INTO SAL,n_empleados from 
employees where department_id=dep_id group by department_id;
RETURN sal;
END;
--PROBAR LA FUNCIÓN
set serveroutput on
declare
TOTAL_SAL NUMBER;
NUM_EMPLE NUMBER;
DEPT NUMBER:=110;
BEGIN
TOTAL_SAL:=salarios_dept1(DEPT,NUM_EMPLE);
DBMS_OUTPUT.PUT_LINE('El salario total del departamento ' || 
DEPT || ' es: ' || TOTAL_SAL);
DBMS_OUTPUT.PUT_LINE('El número total de empleados recabados 
es : ' || NUM_EMPLE);
END;

--Punto 3

create or replace FUNCTION CREAR_REGION (nombre varchar2) 
RETURN NUMBER IS
regiones NUMBER;
NOM_REGION VARCHAR2(100);
BEGIN
--AVERIGUAR SI EXISTE LA REGIÓN. SI YA EXISTE DAMOS 
ERROR. SI NO EXISTE PASAMOS A EXCEPTION Y SEGUIMOS 
CON EL PROGRAMA
SELECT REGION_NAME INTO NOM_REGION FROM REGIONS 
WHERE REGION_NAME=UPPER(NOMBRE);
raise_application_error(-20321,'Esta región ya existe!');

EXCEPTION
-- SI LA REGION NO EXISTE LA INSERTAMOS. ES UN EJEMPLO 
DE COMO PODEMOS USAR LA EXCEPCION PARA HACER ALGO 
CORRECTO
WHEN NO_DATA_FOUND THEN
SELECT
    MAX(region_id) + 1
INTO regiones
FROM
    regions;

INSERT INTO regions (
    region_id,
    region_name
) VALUES (
    regiones,
    upper(nombre)
);

RETURN regiones;

end;
/
--PROBAR LA FUNCIÓN
DECLARE
    n_region NUMBER;
BEGIN
    n_region := crear_region('NORMANDIA');
    dbms_output.put_line('EL NUMERO ASIGNADO 
ES:' || n_region);
END;



