CREATE OR REPLACE PACKAGE pack2 AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */
    FUNCTION count_employees (
        id NUMBER
    ) RETURN NUMBER;

    FUNCTION count_employees (
        id VARCHAR2
    ) RETURN NUMBER;

END pack2;
/

CREATE OR REPLACE PACKAGE BODY pack2 AS

    FUNCTION count_employees (
        id NUMBER
    ) RETURN NUMBER AS
        x NUMBER;
    BEGIN
    -- TODO: Implementation required for FUNCTION PACK2.COUNT_EMPLOYEES
        SELECT
            COUNT(*)
        INTO x
        FROM
            employees
        WHERE
            department_id = id;

        RETURN x;
    END count_employees;

    FUNCTION count_employees (
        id VARCHAR2
    ) RETURN NUMBER AS
        x NUMBER;
    BEGIN
    -- TODO: Implementation required for FUNCTION PACK2.COUNT_EMPLOYEES
        SELECT
            COUNT(*)
        INTO x
        FROM
            employees   a,
            departments b
        WHERE
                department_name = id
            AND a.department_id = b.department_id;

        RETURN x;
    END count_employees;

END pack2;