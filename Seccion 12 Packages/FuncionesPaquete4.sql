SET SERVEROUTPUT ON

DECLARE
    v1 VARCHAR2(100);
BEGIN
    v1 := pack1.convert('AAAAA', 'L');
    dbms_output.put_line(v1);
END;
/

SELECT
    first_name,
    pack1.convert(first_name, 'L'),
    pack1.convert(last_name, 'U')
FROM
    employees;