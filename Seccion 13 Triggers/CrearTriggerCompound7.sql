CREATE OR REPLACE TRIGGER trigger1 FOR
    DELETE OR INSERT OR UPDATE ON regions
COMPOUND TRIGGER
    BEFORE STATEMENT IS BEGIN
        INSERT INTO log_table VALUES (
            'BEFORE STATEMENT',
            user
        );

    END BEFORE STATEMENT;
    AFTER STATEMENT IS BEGIN
        INSERT INTO log_table VALUES (
            'AFTER STATEMENT',
            user
        );

    END AFTER STATEMENT;
    BEFORE EACH ROW IS BEGIN
        INSERT INTO log_table VALUES (
            'BEFORE EACH ROW',
            user
        );

    END BEFORE EACH ROW;
    AFTER EACH ROW IS BEGIN
        INSERT INTO log_table VALUES (
            'AFTER EACH ROW',
            user
        );

    END AFTER EACH ROW;
END trigger1;