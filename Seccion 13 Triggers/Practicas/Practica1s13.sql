--Punto 1
CREATE OR REPLACE TRIGGER t1 BEFORE
    DELETE ON employees
    FOR EACH ROW
BEGIN
    IF :old.job_id LIKE ( '%CLERK' ) THEN
        raise_application_error(-20320, 'NADA');
    END IF;
END;
/

SELECT
    *
FROM
    employees;

DELETE FROM employees
WHERE
    job_id LIKE ( '%CLERK' );

--Punto 2
CREATE TABLE auditoria (
    usuario         VARCHAR(50),
    fecha           DATE,
    salario_antiguo NUMBER,
    salario_nuevo   NUMBER
);

--Punto 3
CREATE TRIGGER t2 BEFORE
    INSERT ON regions
BEGIN
    INSERT INTO auditoria (
        usuario,
        fecha
    ) VALUES (
        user,
        sysdate
    );

END;
/

INSERT INTO regions VALUES (
    20,
    'Prueba'
);

SELECT
    user
FROM
    dual;

SELECT
    *
FROM
    auditoria;

--Punto 4
CREATE OR REPLACE TRIGGER trigger_salario BEFORE
    UPDATE ON employees
    FOR EACH ROW
BEGIN
    IF :new.salary < :old.salary THEN
        raise_application_error(-20000, 'NO SE PUEDE BAJAR EL 
SALARIO');
    END IF;

    IF :new.salary > :old.salary THEN
        INSERT INTO auditoria VALUES (
            user,
            sysdate,
            :old.salary,
            :new.salary
        );

    END IF;

END;

--Punto 5
CREATE OR REPLACE TRIGGER trigger1 BEFORE
    INSERT ON departments
    FOR EACH ROW
DECLARE
    deptno NUMBER;
BEGIN
    SELECT
        department_id
    INTO deptno
    FROM
        departments
    WHERE
        department_id = :new.department_id;

    raise_application_error(-20000, 'Departamento ya existe');
EXCEPTION
    WHEN no_data_found THEN
        IF :new.location_id IS NULL THEN
            :new.location_id := 1700;
        END IF;

        IF :new.manager_id IS NULL THEN
            :new.manager_id := 200;
        END IF;

END;