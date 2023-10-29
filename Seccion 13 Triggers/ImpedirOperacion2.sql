CREATE OR REPLACE TRIGGER tr1_region BEFORE
    INSERT ON regions
BEGIN
    IF user <> 'HR' THEN
        raise_application_error(-20000, 'SOLO HR PUEDE TRABAJAR EN REGIONS');
    END IF;
END;