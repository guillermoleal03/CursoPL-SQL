--TRIGGER PARA CONTROLAR LA TABLA FACTURAS
CREATE OR REPLACE TRIGGER t_facturas BEFORE
    DELETE OR INSERT OR UPDATE ON facturas
DECLARE
    operacion CHAR(1);
BEGIN
    IF inserting THEN
        operacion := 'I';
    END IF;
    IF updating THEN
        operacion := 'U';
    END IF;
    IF deleting THEN
        operacion := 'D';
    END IF;
    INSERT INTO control_log VALUES (
        user,
        sysdate,
        'FACTURAS',
        operacion
    );

END;
/


--TRIGGER PARA CONTROLAR LA TABLA LINEAS_FACTURA
CREATE OR REPLACE TRIGGER t_lineas_facturas BEFORE
    DELETE OR INSERT OR UPDATE ON lineas_factura
DECLARE
    operacion CHAR(1);
BEGIN
    IF inserting THEN
        operacion := 'I';
    END IF;
    IF updating THEN
        operacion := 'U';
    END IF;
    IF deleting THEN
        operacion := 'D';
    END IF;
    INSERT INTO control_log VALUES (
        user,
        sysdate,
        'LINEAS_FACTURA',
        operacion
    );

END;
/


--TRIGGER PARA CONTROLAR LA COLUMNA TOTAL_VENDIDOS DE LA TABLA PRODUCTOS
CREATE OR REPLACE TRIGGER t_lineas_facturas_precio AFTER
    DELETE OR INSERT OR UPDATE ON lineas_factura
    FOR EACH ROW
DECLARE
  --- VARIABLE PARA CONTROLA REL UPDATE
    total_cambio NUMBER := 0;
BEGIN
    IF inserting THEN
        UPDATE productos
        SET
            total_vendidos = total_vendidos + ( :new.pvp * :new.unidades )
        WHERE
            cod_producto = :new.cod_producto;

    END IF;

    IF updating THEN
        total_cambio := ( :old.pvp * :old.unidades ) - ( :new.pvp * :new.unidades );

        UPDATE productos
        SET
            total_vendidos = total_vendidos + total_cambio
        WHERE
            cod_producto = :new.cod_producto;

    END IF;

    IF deleting THEN
        UPDATE productos
        SET
            total_vendidos = total_vendidos - ( :new.pvp * :new.unidades )
        WHERE
            cod_producto = :new.cod_producto;

    END IF;

END;