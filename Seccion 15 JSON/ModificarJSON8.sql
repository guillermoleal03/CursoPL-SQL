/*

   MODIFICAR JSON
   
   - Antes de la 19c- Había que modificar todo el campo completo
   - En la 19c aparece JSON_MERGEPATCH para actualizar trozos
   - En la 21c aparece JSON_TRANSFORM que es un poco más potente
   
   */


SELECT
    datos
FROM
    productos1;
   
   -- Modificar uno existente
UPDATE productos1
SET
    datos = '
  {
    "pais": "Argentina",
    "ciudad": "Buenos aires",
    "poblacion": 2000000
  }'
WHERE
    codigo = 1;
  
  
  -- Añadir un elemento
UPDATE productos1
SET
    datos = '
  {
    "pais": "Argentina",
    "ciudad": "Buenos aires",
    "poblacion": 2100000,
    "estado": true
  }'
WHERE
    codigo = 1;
  
  -- JSON_MERGEPATCH
UPDATE productos1
SET
    datos = json_mergepatch(datos, '{
            "estado": false
      }')
WHERE
    codigo = 1;

UPDATE productos1
SET
    datos = json_mergepatch(datos, '{
            "estado": true,
            "c1": 10
      }')
WHERE
    codigo = 1;