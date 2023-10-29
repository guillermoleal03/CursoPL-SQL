CREATE OR REPLACE TRIGGER tr1_region BEFORE
    INSERT OR UPDATE OR DELETE ON regions
BEGIN
    IF inserting THEN
        INSERT INTO log_table VALUES (
            'INSERCION',
            user
        );

    END IF;
    IF updating('REGION_NAME') THEN
        INSERT INTO log_table VALUES (
            'UPDATE DE REGION_NAME',
            user
        );

    END IF;

    IF updating('REGION_ID') THEN
        INSERT INTO log_table VALUES (
            'UPDATE DE REGION_ID',
            user
        );

    END IF;

    IF deleting THEN
        INSERT INTO log_table VALUES (
            'DELETE',
            user
        );

    END IF;
   
  /*IF USER <>'HR' THEN
    RAISE_APPLICATION_ERROR(-20000,'SOLO HR PUEDE TRABAJAR EN REGIONS');
  END IF;*/

END;