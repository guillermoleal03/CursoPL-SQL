/*
  Objetos JSON en PL/SQL
  

 JSON_ARRAY_T : Un objeto que representa un array  JSON.
 
 APPEND
 APPEND_NULL
 PUT
 PUT_NULL

*/

-- Crear el array
json1 := json_array_t('["bmw","mercedes","citroen"]');

dbms_output.put_line(json1.to_string);
 
-- Ver el numero de posiciones
dbms_output.put_line(json1.get_size);