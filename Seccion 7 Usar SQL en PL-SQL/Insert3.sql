DECLARE
    col1 test.c1%TYPE;
BEGIN
    col1 := 20;
    INSERT INTO test (
        c1,
        c2
    ) VALUES (
        col1,
        'HOLA MUNDO'
    );

    COMMIT;
END;