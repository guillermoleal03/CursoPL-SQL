SET SERVEROUTPUT ON

BEGIN
    pack1.v1 := 100;
    pack1.v2 := 'AAAAA';
    dbms_output.put_line(pack1.v1);
    dbms_output.put_line(pack1.v2);
END;