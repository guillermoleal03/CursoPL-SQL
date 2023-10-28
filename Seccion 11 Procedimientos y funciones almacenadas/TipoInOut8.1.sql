set serveroutput on

DECLARE
    a NUMBER;
    b NUMBER;
    r NUMBER;
BEGIN
    a := 120;
    b := 10;
 -- R:=1000;
    calc_tax_in_out(a, b);
    dbms_output.put_line('B=' || b);
END;
/