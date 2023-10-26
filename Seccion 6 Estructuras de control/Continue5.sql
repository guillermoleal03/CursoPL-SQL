DECLARE
    x NUMBER := 0;
BEGIN
    LOOP -- CON CONTINUE SALTAMOS AQUI
        dbms_output.put_line('LOOP:  x = ' || to_char(x));
        x := x + 1;
    /*IF x < 3 THEN
      CONTINUE;
    END IF;*/
        CONTINUE WHEN x < 3;
        dbms_output.put_line('DESPUES DE  CONTINUE:  x = ' || to_char(x));
        EXIT WHEN x = 5;
    END LOOP;

    dbms_output.put_line(' DESPUES DEL  LOOP:  x = ' || to_char(x));
END;
/