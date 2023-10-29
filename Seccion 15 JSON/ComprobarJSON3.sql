/*
   IS JSON
   IS NOT JSON

*/

CREATE TABLE ejemplo (
    codigo  INT,
    fichero CLOB
);

INSERT INTO ejemplo VALUES (
    1,
    '{"col1":"prueba"}'
);

INSERT INTO ejemplo VALUES (
    2,
    'Esto es una prueba'
);

INSERT INTO ejemplo VALUES (
    3,
    '<doc> <col1>prueba</col1></doc>'
);

SELECT
    *
FROM
    ejemplo
WHERE
    fichero IS JSON;

SELECT
    *
FROM
    ejemplo
WHERE
    fichero IS NOT JSON;