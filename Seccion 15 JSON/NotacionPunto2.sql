SELECT
    datos
FROM
    productos1;

SELECT
    prod1.datos.pais
FROM
    productos1 prod1;

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

SELECT
    prod1.datos.direccion
FROM
    productos1 prod1;

SELECT
    prod1.datos.direccion.puerta
FROM
    productos1 prod1;

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

SELECT
    datos
FROM
    productos1;

SELECT
    prod1.datos.telefonos
FROM
    productos1 prod1;

SELECT
    prod1.datos.telefonos[0]
FROM
    productos1 prod1;