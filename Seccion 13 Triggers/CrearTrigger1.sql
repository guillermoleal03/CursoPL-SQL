CREATE OR REPLACE TRIGGER ins_empl AFTER
    INSERT ON regions
BEGIN
    INSERT INTO log_table VALUES (
        'INSERCION EN LA TABLA REGIONS',
        user
    );

END;