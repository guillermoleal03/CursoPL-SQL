/*

   JSON_TABLE
   (campo_json,lista_de_columnas)
   
   Permite convertir datos JSON a relacionales
   */




SELECT
    pais,
    ciudad
FROM
    productos1 prod1,
    JSON_TABLE ( prod1.datos, '$'
            COLUMNS (
                pais PATH '$.pais',
                ciudad PATH '$.ciudad'
            )
        );

SELECT
    pais,
    direccion
FROM
    productos1 prod1,
    JSON_TABLE ( prod1.datos, '$'
            COLUMNS (
                pais PATH '$.pais',
                direccion PATH '$.direccion.calle'
            )
        );