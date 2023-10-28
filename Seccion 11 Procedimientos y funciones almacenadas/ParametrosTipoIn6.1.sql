set serveroutput on

DECLARE
    a NUMBER;
    b NUMBER;
BEGIN
    a := 120;
    b := 5;
    calc_tax(a, b);
END;
/