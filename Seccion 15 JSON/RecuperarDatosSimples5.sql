/*

   JSON_VALUE(campo_json,expresion_json);
   
   Deveulve un valor único, de tipo escalar
   */


SELECT
    JSON_VALUE(prod1.datos, '$.pais')
FROM
    productos1 prod1;

SELECT
    JSON_VALUE(prod1.datos, '$.pais' RETURNING VARCHAR(100))
FROM
    productos1 prod1;
-- Si no son escalare no funciona
SELECT
    JSON_VALUE(prod1.datos, '$.direccion')
FROM
    productos1 prod1;

SELECT
    JSON_VALUE(prod1.datos, '$.telefonos')
FROM
    productos1 prod1;

SELECT
    JSON_VALUE(prod1.datos, '$.telefonos[0]')
FROM
    productos1 prod1;