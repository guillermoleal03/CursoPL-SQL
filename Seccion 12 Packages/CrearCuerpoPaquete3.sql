CREATE OR REPLACE PACKAGE pack1 IS
    PROCEDURE convert (
        name            VARCHAR2,
        conversion_type CHAR
    );

END;
/

CREATE OR REPLACE PACKAGE BODY pack1 IS

    FUNCTION up (
        name VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        RETURN upper(name);
    END up;

    FUNCTION do (
        name VARCHAR2
    ) RETURN VARCHAR2 IS
    BEGIN
        RETURN lower(name);
    END do;

    PROCEDURE convert (
        name            VARCHAR2,
        conversion_type CHAR
    ) IS
    BEGIN
        IF conversion_type = 'U' THEN
            dbms_output.put_line(up(name));
        ELSIF conversion_type = 'L' THEN
            dbms_output.put_line(do(name));
        ELSE
            dbms_output.put_line('EL PARAMETRO DEBE SER U o L');
        END IF;
    END convert;

END pack1;