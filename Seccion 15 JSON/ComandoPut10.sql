-- Poner contenido escalar
json1.put('edad', 29);

json1.put('telefono', '99999999');

dbms_output.put_line(json1.to_string);
  
  -- Poner un documento anidado
json1.put('direccion', '{"calle":"pez","numero":5,"ciudad":"madrid"}');

dbms_output.put_line(json1.to_string);

json1.put('direccion', json_object_t('{"calle":"pez","numero":5,"ciudad":"madrid"}'));

dbms_output.put_line(json1.to_string);

   -- Poner un array
json1.put('experiencia', json_array_t('["excel","word","python","linux"]'));

dbms_output.put_line(json1.to_string);