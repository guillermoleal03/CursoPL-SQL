DECLARE
    reg_max EXCEPTION;
    regn NUMBER;
    regt VARCHAR2(200);
BEGIN
    regn := 101;
    regt := 'ASIA';
    IF regn > 100 THEN
        RAISE reg_max;
    ELSE
        INSERT INTO regions VALUES (
            regn,
            regt
        );

        COMMIT;
    END IF;

EXCEPTION
    WHEN reg_max THEN
        dbms_output.put_line('La region no puede ser mayor de 100.');
    WHEN OTHERS THEN
        dbms_output.put_line('Error indefinido');
END;
/