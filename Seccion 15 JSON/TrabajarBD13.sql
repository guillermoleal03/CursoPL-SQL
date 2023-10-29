/*
  Objetos JSON en PL/SQL
  

 Trabajar con la base de datos

*/
set serveroutput on format wrapped line 1000;

SELECT
    JSON_OBJECT(
        datos
    )
FROM
    productos1;

DECLARE
    json1     json_object_t;
    v1        VARCHAR2(4000);
    resultado VARCHAR2(4000);
BEGIN
    SELECT
        datos
    INTO v1
    FROM
        productos1
    WHERE
        codigo = 3;

    json1 := json_object_t(v1);
    dbms_output.put_line(json1.to_string);
    json1.put('c1', 'ejemplo');
    resultado := json1.to_string;
    UPDATE productos1
    SET
        datos = resultado
    WHERE
        codigo = 3;

END;
/