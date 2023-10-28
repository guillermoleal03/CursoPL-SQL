set serveroutput on

DECLARE
    a NUMBER;
    b NUMBER;
    r NUMBER;
BEGIN
    a := 120;
    b := 10;
    r := 0;
    calc_tax_out(a, b, r);
    dbms_output.put_line('R=' || r);
END;
/