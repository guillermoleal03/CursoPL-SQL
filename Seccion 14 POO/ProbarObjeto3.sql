set serveroutput on format wrapped line 1000;

DECLARE
    v1 producto := producto(100, 'manzanas', 10);
BEGIN
    dbms_output.put_line(v1.ver_producto());
    dbms_output.put_line(v1.ver_precio());
    v1.cambiar_precio(20);
    dbms_output.put_line(v1.ver_precio());
END;
/