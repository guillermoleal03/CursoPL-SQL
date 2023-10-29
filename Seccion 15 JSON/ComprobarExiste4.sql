/*

   JSON_EXISTS(campo_json,expresion_json,on_error);
   */

DROP TABLE productos1;

CREATE TABLE productos1 (
    codigo INT,
    nombre VARCHAR2(200),
    datos  json
);

INSERT INTO productos1 VALUES (
    1,
    'ejemplo1',
    '
  {
    "pais": "Argentina",
    "ciudad": "Buenos aires",
    "poblacion": 1000000
  }
'
);

INSERT INTO productos1 VALUES (
    2,
    'ejemplo1',
    '
  {
    "pais": "Argentina",
    "ciudad": "Buenos aires",
    "poblacion": 1000000,
    "direccion":{
             "calle": "xcxxxxx",
             "piso": 5,
             "puerta": "c"
             }
  }
'
);

INSERT INTO productos1 VALUES (
    3,
    'ejemplo3',
    '
  {
    "pais": "Francia",
    "ciudad": "Paris",
    "poblacion": 1500000,
    "direccion":{
             "calle": "xcxxxxx",
             "piso": 5,
             "puerta": "c"
             },
    "telefonos": [
        "111-111111",
        "222-222222"
    ]
  }
'
);

INSERT INTO productos1 VALUES (
    4,
    'ejemplo4',
    '
  {
    "pais": "Italia",
    "ciudad": "Roma",
    "poblacion": 1400000,
    "direccion":{
             "calle": "xcxxxxx",
             "piso": 4,
             "puerta": ""
             },
    "telefonos": [
        "111-111111AA",
        "222-222222BB"
    ]
  }
'
);

INSERT INTO productos1 VALUES (
    5,
    'ejemplo5',
    '
  {
    "pais": "Inglaterra",
    "ciudad": "Londres",
    "poblacion": 10009000
  }
'
);

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

SELECT
    prod1.datos.pais
FROM
    productos1 prod1;