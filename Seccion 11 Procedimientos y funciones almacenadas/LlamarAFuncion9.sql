set serveroutput on

DECLARE
    a NUMBER;
    b NUMBER;
    r NUMBER;
BEGIN
    a := 120;
    b := 10;
    r := calc_tax_f(a, b);
    dbms_output.put_line('R=' || r);
END;
/