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