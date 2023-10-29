-- Actualizar dato
json1.put('edad', 45);

dbms_output.put_line(json1.to_string);
  
  -- Renombrar clave
json1.rename_key('nombre', 'nombre_completo');

dbms_output.put_line(json1.to_string);
  
  -- Eliminar un elemento
json1.remove('telefono');

dbms_output.put_line(json1.to_string);