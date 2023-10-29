/*

   JSON_QUERY(campo_json,expresion_json,on_error);
   
   Permite devolver un valor, array o un sub-documento anidado
   */
SELECT
    JSON_QUERY(prod1.datos, '$.pais')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.direccion')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.direccion.calle')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.telefonos')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.telefonos[0]')
FROM
    productos1 prod1;