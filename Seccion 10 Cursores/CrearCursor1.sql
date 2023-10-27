DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        regions;

    v1 regions%rowtype;
BEGIN
    OPEN c1;
    FETCH c1 INTO v1;
    dbms_output.put_line(v1.region_name);
    FETCH c1 INTO v1;
    dbms_output.put_line(v1.region_name);
    CLOSE c1;
END;