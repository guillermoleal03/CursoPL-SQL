BEGIN
    FOR i IN (
        SELECT
            *
        FROM
            regions
    ) LOOP
        dbms_output.put_line(i.region_name);
    END LOOP;
END;