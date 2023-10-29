CREATE OR REPLACE TYPE comestibles UNDER producto (
        caducidad DATE,
        MEMBER FUNCTION ver_caducidad RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY comestibles AS
    MEMBER FUNCTION ver_caducidad RETURN VARCHAR2 AS
    BEGIN
        RETURN caducidad;
    END;

END;
/

DECLARE
    v1 comestibles := comestibles(900, 'tornillos', 20, sysdate());
BEGIN
    dbms_output.put_line(v1.ver_precio());
    dbms_output.put_line(v1.ver_precio(10));
    dbms_output.put_line(v1.ver_caducidad);
END;
/