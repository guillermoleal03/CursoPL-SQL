-- Crear el array
json1 := json_array_t('["bmw","mercedes","citroen"]');

dbms_output.put_line(json1.to_string);
 
-- Ver el numero de posiciones
dbms_output.put_line(json1.get_size);

-- Añadir un elemento
json1.append('ford');

dbms_output.put_line(json1.to_string);

  -- Añadir un nulo
json1.append_null;

dbms_output.put_line(json1.to_string);

 -- Poner un valor en una determinada posición
json1.put(2, 'renault');

dbms_output.put_line(json1.to_string);
 
  -- Eliminar un elemento
json1.remove(3);

dbms_output.put_line(json1.to_string);
   
   -- Ponerun array
json1.put(3, json_array_t('["f1","f2","f3"]'));

dbms_output.put_line(json1.to_string);

  -- Añadir un subdocumento
json1.append(json_element_t.parse('{"nombre":"alberto","apellidos":"perez Rodriguez"}'));

dbms_output.put_line(json1.to_string);