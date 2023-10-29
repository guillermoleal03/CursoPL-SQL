SELECT
    JSON_VALUE(prod1.datos, '$.pais')
INTO c1
FROM
    productos1 prod1
WHERE
    codigo = 3;

dbms_output.put_line(c1);

SELECT
    JSON_VALUE(prod1.datos, '$.direccion')
INTO c1
FROM
    productos1 prod1
WHERE
    codigo = 3;

dbms_output.put_line(c1);

SELECT
    JSON_VALUE(rod1.datos, '$.direccion.calle')
INTO c1
FROM
    productos1 prod1
WHERE
    codigo = 3;

dbms_output.put_line(c1);

SELECT
    JSON_QUERY(prod1.datos, '$.direccion')
INTO c1
FROM
    productos1 prod1
WHERE
    codigo = 3;

dbms_output.put_line(c1);

SELECT
    JSON_QUERY(prod1.datos, '$.direccion.calle')
INTO c1
FROM
    productos1 prod1
WHERE
    codigo = 3;

dbms_output.put_line(c1);
  
  select json_transform(datos, rename '$.poblacion'='pob') into c1 from productos1 where
        codigo = 3;
        dbms_output.put_line ( c1 );