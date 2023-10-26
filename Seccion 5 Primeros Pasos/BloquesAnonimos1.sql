--Bloques anonimos
SET SERVEROUTPUT ON

DECLARE
    name     VARCHAR2(100);
    lastname VARCHAR2(100);
    x        CONSTANT NUMBER := 10;
    z        NUMBER NOT NULL := 20;
BEGIN
    name := 'FRAN';
    lastname := 'GARCIA';
    dbms_output.put_line(name
                         || ' '
                         || lastname);
    dbms_output.put_line(100);
    dbms_output.put_line('GUILLO' || ' LEAL');
    dbms_output.put_line(x);
    z := 30;
    dbms_output.put_line(z);
END;