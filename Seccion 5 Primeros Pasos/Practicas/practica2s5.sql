SET SERVEROUTPUT ON;

DECLARE
    impuesto  CONSTANT NUMBER := 21;
    precio    NUMBER(5, 2);
    resultado precio%TYPE;
BEGIN
    precio := 90;
    resultado := precio * impuesto / 100;
    dbms_output.put_line(resultado);
END;