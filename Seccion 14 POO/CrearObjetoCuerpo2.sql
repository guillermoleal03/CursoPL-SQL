CREATE OR REPLACE TYPE BODY producto AS
    MEMBER FUNCTION ver_producto RETURN VARCHAR2 AS
    BEGIN
        RETURN nombre
               || ' '
               || precio;
    END ver_producto;

    MEMBER FUNCTION ver_precio RETURN NUMBER AS
    BEGIN
        RETURN precio;
    END ver_precio;

    MEMBER PROCEDURE cambiar_precio (
        pvp NUMBER
    ) AS
    BEGIN
        precio := pvp;
    END cambiar_precio;

END;
/