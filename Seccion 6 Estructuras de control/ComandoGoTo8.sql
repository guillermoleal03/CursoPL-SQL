DECLARE
    p VARCHAR2(30);
    n PLS_INTEGER := 5;
BEGIN
    FOR j IN 2..round(sqrt(n)) LOOP
        IF n MOD j = 0 THEN
            p := ' no es un n�mero primo';
            GOTO print_now;
        END IF;
    END LOOP;

    p := ' Es un n�mero primo';
    << print_now >> dbms_output.put_line(to_char(n)
                                         || p);
END;
/