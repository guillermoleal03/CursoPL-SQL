--Punto 1
--PACKAGE HEAD
CREATE OR REPLACE PACKAGE regiones IS
    PROCEDURE alta_region (
        codigo NUMBER,
        nombre VARCHAR2
    );

    PROCEDURE baja_region (
        id NUMBER
    );

    PROCEDURE mod_region (
        id     NUMBER,
        nombre VARCHAR2
    );

    FUNCTION con_regiom (
        codigo NUMBER
    ) RETURN VARCHAR2;

END regiones;
/
--BODY / PROCEDURE ALTA REGIÓN
CREATE OR REPLACE PACKAGE BODY regiones IS
--FUNCIÓN EXISTE_REGION
    FUNCTION existe_region (
        id     NUMBER,
        nombre VARCHAR2
    ) RETURN BOOLEAN IS
        CURSOR c1 IS
        SELECT
            region_name,
            region_id
        FROM
            regions;

        y VARCHAR2(20);
    BEGIN
        FOR i IN c1 LOOP
            IF
                i.region_name = nombre
                AND i.region_id = id
            THEN
                RETURN TRUE;
            END IF;
        END LOOP;

        RETURN FALSE;
    END;

    PROCEDURE alta_region (
        codigo NUMBER,
        nombre VARCHAR2
    ) IS
        devuelto BOOLEAN;
    BEGIN
        devuelto := existe_region(codigo, nombre);
        IF devuelto = false THEN
            INSERT INTO regions (
                region_id,
                region_name
            ) VALUES (
                codigo,
                nombre
            );

            dbms_output.put_line('Inserción correcta');
        ELSE
            dbms_output.put_line('La región ya existe.');
        END IF;

    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('La ID YA EXISTE (duplicada)');
    END;
--PROCEDURE BAJA_REGION
    PROCEDURE baja_region (
        id NUMBER
    ) IS
        devuelto BOOLEAN;
        otro     VARCHAR2(20);
    BEGIN
        SELECT
            region_name
        INTO otro
        FROM
            regions
        WHERE
            region_id = id;

        devuelto := existe_region(id, otro);
        IF devuelto = true THEN
            DELETE FROM regions
            WHERE
                region_id = id;

            dbms_output.put_line('Región con ID '
                                 || id
                                 || ' borrada');
        END IF;

    EXCEPTION
        WHEN no_data_found THEN
            dbms_output.put_line('La región no existe!');
    END;
--PROCEDURE MOD_REGION
    PROCEDURE mod_region (
        id     NUMBER,
        nombre VARCHAR2
    ) IS
        devuelto BOOLEAN;
    BEGIN
        devuelto := existe_region(id, nombre);
        IF devuelto = true THEN
            UPDATE regions
            SET
                region_name = nombre
            WHERE
                region_id = id;

            dbms_output.put_line('La región ha sido actualizada.');
        ELSE
            dbms_output.put_line('La región no existe.');
        END IF;

    END;
--FUNCIÓN CON_REGIOM
    FUNCTION con_regiom (
        codigo NUMBER
    ) RETURN VARCHAR2 IS
        nombre_devolver VARCHAR2(20);
    BEGIN
        SELECT
            region_name
        INTO nombre_devolver
        FROM
            regions
        WHERE
            region_id = codigo;

        RETURN nombre_devolver;
    END;

END regiones;
/

EXECUTE mod_region(7,'pikachutotal');
EXECUTE regiones.baja_region(10);
EXECUTE regiones.alta_region(10,'Prueba');

SELECT
    *
FROM
    regions;

DELETE FROM regions
WHERE
    region_id > 4;

ROLLBACK;

--Punto 2

CREATE OR REPLACE PACKAGE nomina IS
    FUNCTION calcular_nomina (
        id NUMBER
    ) RETURN NUMBER;

    FUNCTION calcular_nomina (
        id         NUMBER,
        porcentaje VARCHAR
    ) RETURN NUMBER;

    FUNCTION calcular_nomina (
        id         NUMBER,
        porcentaje NUMBER,
        tercero    VARCHAR2 := 'V'
    ) RETURN NUMBER;

END nomina;
/
CREATE OR REPLACE PACKAGE BODY NOMINA IS
--PRIMERA FUNCION
•
FUNCTION calcular_nomina ( id NUMBER ) RETURN NUMBER IS
salario_final NUMBER;
salario NUMBER;
BEGIN
SELECT salary INTO salario from employees where employee_id=id;
salario_final := salario - ( salario * 0.15 );
RETURN salario_final;
END;
--SEGUNDA FUNCION
FUNCTION calcular_nomina ( id NUMBER,porcentaje varchar ) 
RETURN NUMBER IS
salario_final NUMBER;
salario NUMBER;
BEGIN
SELECT salary INTO salario from employees where employee_id=id;
salario_final := salario - ( salario * (to_number(porcentaje)/100 ));
RETURN salario_final;
END;
--TERCERA FUNCION
FUNCTION calcular_nomina (
id NUMBER,
porcentaje NUMBER,
tercero VARCHAR2 := 'V'
) RETURN NUMBER IS
salario_final NUMBER;
comision NUMBER;
salario NUMBER;
BEGIN
SELECT salary into salario from employees where employee_id=id;
SELECT commission_pct into comision from employees where 
employee_id=id;
salario_final := salario - ( salario * (porcentaje/100 )) + (salario*comision);
RETURN salario_final;
END;
END NOMINA;
/
declare
x number;
BEGIN
x := nomina.calcular_nomina(150, '8');

dbms_output.put_line(x);

end;
/

desc nomina;

