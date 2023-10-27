--Ejercicio 1
DECLARE
    CURSOR c1 IS
    SELECT
        first_name,
        last_name,
        salary
    FROM
        employees;

BEGIN
    FOR i IN c1 LOOP
        IF
            i.first_name = 'Steven'
            AND i.last_name = 'King'
        THEN
            raise_application_error(-20300, 'El salario del jefe no puede ser visto');
        ELSE
            dbms_output.put_line(i.first_name
                                 || ' '
                                 || i.last_name
                                 || ': '
                                 || i.salary
                                 || 'DLS');
        END IF;
    END LOOP;
END;

--Ejercicio 2 

SET SERVEROUTPUT ON

DECLARE
    departamento departments%rowtype;
    jefe         departments.manager_id%TYPE;
    CURSOR c1 IS
    SELECT
        *
    FROM
        employees;

    CURSOR c2 (
        j departments.manager_id%TYPE
    ) IS
    SELECT
        *
    FROM
        departments
    WHERE
        manager_id = j;

BEGIN
    FOR empleado IN c1 LOOP
        OPEN c2(empleado.employee_id);
        FETCH c2 INTO departamento;
        IF c2%notfound THEN
            dbms_output.put_line(empleado.first_name || ' No es JEFE de 
NADA');
        ELSE
            dbms_output.put_line(empleado.first_name
                                 || 'ES JEFE DEL
DEPARTAMENTO '
                                 || departamento.department_name);
        END IF;

        CLOSE c2;
    END LOOP;
END;

--Ejercicio 3
SET SERVEROUTPUT ON

DECLARE
    codigo    departments.department_id%TYPE;
    CURSOR c1 (
        cod departments.department_id%TYPE
    ) IS
    SELECT
        COUNT(*)
    FROM
        employees
    WHERE
        department_id = cod;

    num_emple NUMBER;
BEGIN
    codigo := 10;
    OPEN c1(codigo);
    FETCH c1 INTO num_emple;
    dbms_output.put_line('numero de empleados de '
                         || codigo
                         || ' es 
'
                         || num_emple);
END;

--Ejercicio 4
BEGIN
    FOR emple IN (
        SELECT
            *
        FROM
            employees
        WHERE
            job_id = 'ST_CLERK'
    ) LOOP
        dbms_output.put_line(emple.first_name);
    END LOOP;
END;

--Ejercicio 5 
SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        employees
    FOR UPDATE;

BEGIN
    FOR empleado IN c1 LOOP
        IF empleado.salary > 8000 THEN
            UPDATE employees
            SET
                salary = salary * 1.02
            WHERE
                CURRENT OF c1;

        ELSE
            UPDATE employees
            SET
                salary = salary * 1.03
            WHERE
                CURRENT OF c1;

        END IF;
    END LOOP;

    COMMIT;
END;