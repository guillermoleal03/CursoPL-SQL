--Punto 1

CREATE OR REPLACE PROCEDURE visualizar IS

    CURSOR c1 IS
    SELECT
        first_name,
        salary
    FROM
        employees;

    v_nombre  employees.first_name%TYPE;
    v_salario employees.salary%TYPE;
BEGIN
    FOR i IN c1 LOOP
        dbms_output.put_line(i.first_name
                             || ' '
                             || i.salary);
    END LOOP;
END;
/

EXECUTE visualizar;

--Punto 2

CREATE OR REPLACE PROCEDURE visualizar (
    departamento NUMBER,
    numero       OUT NUMBER
) IS

    CURSOR c1 IS
    SELECT
        first_name,
        salary
    FROM
        employees
    WHERE
        department_id = departamento;

    v_nombre  employees.first_name%TYPE;
    v_salario employees.salary%TYPE;
BEGIN
    numero := 0;
    FOR i IN c1 LOOP
        dbms_output.put_line(i.first_name
                             || ' '
                             || i.salary);
        numero := numero + 1;
    END LOOP;

END;
--Probar
DECLARE
    x NUMBER;
BEGIN
    visualizar(60, x);
    dbms_output.put_line('El número de empleados es:' || x);
END;

--Punto 3

CREATE OR REPLACE PROCEDURE formateo_cuenta (
    numero IN OUT VARCHAR2
) IS

    guardar1 VARCHAR2(20);
    guardar2 VARCHAR2(20);
    guardar3 VARCHAR2(20);
    guardar4 VARCHAR2(20);
BEGIN
    guardar1 := substr(numero, 1, 4);
    guardar2 := substr(numero, 5, 4);
    guardar3 := substr(numero, 9, 2);
    guardar4 := substr(numero, 10);
    numero := guardar1
              || '-'
              || guardar2
              || '-'
              || guardar3
              || '-'
              || guardar4;

END;