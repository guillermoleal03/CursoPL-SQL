CREATE OR REPLACE PACKAGE lineas_facturasp AS
    PROCEDURE alta_linea (
        codigo   NUMBER,
        cod_prod NUMBER,
        unid     NUMBER,
        fec      DATE
    );

    PROCEDURE baja_linea (
        codigo   NUMBER,
        cod_prod NUMBER
    );

    PROCEDURE mod_producto (
        codigo   NUMBER,
        cod_prod NUMBER,
        unid     NUMBER
    );

    PROCEDURE mod_producto (
        codigo    NUMBER,
        cod_prod  NUMBER,
        fecha_mod DATE
    );

    FUNCTION num_lineas (
        codigo NUMBER
    ) RETURN NUMBER;

END lineas_facturasp;
/

CREATE OR REPLACE PACKAGE BODY lineas_facturasp AS

--FUNCIÓN ADICIONAL PARA COMPROBAR SI EXISTE UNA FACTURA, Se trata de una función PRIVADA

    FUNCTION existe (
        codigo   NUMBER,
        cod_prod NUMBER
    ) RETURN BOOLEAN IS
        cont  NUMBER := 0;
        cod_f lineas_factura.cod_factura%TYPE;
    BEGIN
 --Comprobar si existe la factura:
        SELECT
            cod_factura
        INTO cod_f
        FROM
            lineas_factura
        WHERE
                cod_factura = codigo
            AND cod_producto = cod_prod;

        RETURN TRUE;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN FALSE;
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR' || sqlcode);
    END;

--PROCEDURE ALTA_FACTURA

    PROCEDURE alta_linea (
        codigo   NUMBER,
        cod_prod NUMBER,
        unid     NUMBER,
        fec      DATE
    ) AS
        devuelto BOOLEAN;
        erroryaexiste EXCEPTION;
        precio   NUMBER;
    BEGIN
        devuelto := existe(codigo, cod_prod);
        IF NOT devuelto THEN
            SELECT
                pvp
            INTO precio
            FROM
                productos
            WHERE
                cod_producto = cod_prod;

            INSERT INTO lineas_factura VALUES (
                codigo,
                cod_prod,
                precio,
                unid,
                fec
            );

            COMMIT;
        ELSE
            RAISE erroryaexiste;
        END IF;

    EXCEPTION
        WHEN erroryaexiste THEN
            raise_application_error(-20001, 'ERROR, ESA FACTURA-PRODUCTO YA EXISTE, NO SE ADMITEN DUPLICADOS');
        WHEN no_data_found THEN
            raise_application_error(-20002, 'ERROR, EL PRODUCTO NO EXISTE');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR' || sqlcode);
    END;

--PROCEDURE BAJA_FACTURA.

    PROCEDURE baja_linea (
        codigo   NUMBER,
        cod_prod NUMBER
    ) AS
        errornoexiste EXCEPTION;
        devuelto BOOLEAN;
    BEGIN
        devuelto := existe(codigo, cod_prod);
        IF devuelto = true THEN
            DELETE FROM lineas_factura
            WHERE
                    cod_factura = codigo
                AND cod_producto = cod_prod;

            COMMIT;
        ELSE
            RAISE errornoexiste;
        END IF;

    EXCEPTION
        WHEN errornoexiste THEN
            raise_application_error(-20001, 'ERROR, ESE NÚMERO DE FACTURA -PRODUCTO NO EXISTE');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR' || sqlcode);
    END;

--Procedure MOD_FECHA

    PROCEDURE mod_producto (
        codigo    NUMBER,
        cod_prod  NUMBER,
        fecha_mod DATE
    ) IS
        devuelto BOOLEAN;
        errornoexiste EXCEPTION;
    BEGIN
        devuelto := existe(codigo, cod_prod);
        IF devuelto = true THEN
            UPDATE lineas_factura
            SET
                fecha = fecha_mod
            WHERE
                    cod_factura = codigo
                AND cod_producto = cod_prod;

            COMMIT;
        ELSE
            RAISE errornoexiste;
        END IF;

    EXCEPTION
        WHEN errornoexiste THEN
            raise_application_error(-20001, 'ERROR, ESE NÚMERO DE FACTURA NO EXISTE');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR' || sqlcode);
    END;

    PROCEDURE mod_producto (
        codigo   NUMBER,
        cod_prod NUMBER,
        unid     NUMBER
    ) IS
        devuelto BOOLEAN;
        errornoexiste EXCEPTION;
    BEGIN
        devuelto := existe(codigo, cod_prod);
        IF devuelto = true THEN
            UPDATE lineas_factura a
            SET
                unidades = unid,
                pvp = (
                    SELECT
                        pvp
                    FROM
                        productos
                    WHERE
                        cod_producto = a.cod_producto
                )
            WHERE
                    cod_factura = codigo
                AND cod_producto = cod_prod;

            COMMIT;
        ELSE
            RAISE errornoexiste;
        END IF;

    EXCEPTION
        WHEN errornoexiste THEN
            raise_application_error(-20001, 'ERROR, ESE NÚMERO DE FACTURA NO EXISTE');
        WHEN OTHERS THEN
            raise_application_error(-20000, 'ERROR' || sqlcode);
    END;

--Función NUM_FACTURAS

    FUNCTION num_lineas (
        codigo NUMBER
    ) RETURN NUMBER AS
        cont NUMBER := 0;
    BEGIN
        SELECT
            COUNT(*)
        INTO cont
        FROM
            lineas_factura
        WHERE
            cod_factura = codigo;

        RETURN cont;
    END;

--FUNCION TOTAL_FACTURA


END lineas_facturasp;