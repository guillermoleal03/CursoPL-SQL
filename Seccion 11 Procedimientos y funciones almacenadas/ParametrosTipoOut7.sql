CREATE OR REPLACE PROCEDURE calc_tax_out (
    empl IN employees.employee_id%TYPE,
    t1   IN NUMBER,
    r1   OUT NUMBER
) IS
  --TAX NUMBER:=0;
    sal NUMBER := 0;
BEGIN
    IF t1 < 0 OR t1 > 60 THEN
        raise_application_error(-20000, 'EL PORCENTAJE DEBE ESTAR ENTRE 0 Y 60');
    END IF;

    SELECT
        salary
    INTO sal
    FROM
        employees
    WHERE
        employee_id = empl;
   --T1:=0;
    r1 := sal * t1 / 100;
    dbms_output.put_line('SALARY:' || sal);
  -- DBMS_OUTPUT.PUT_line('TAX:'||TAX);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('NO EXISTE EL EMPLEADO');
END;