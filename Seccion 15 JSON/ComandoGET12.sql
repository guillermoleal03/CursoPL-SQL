-- SERIALIZACION
   -- Recuperar valores concretos
v1 := json1.get_string('nombre_completo');

dbms_output.put_line(v1);
   
   -- Nos puede dar error de datos
v1 := json1.get_number('nombre_completo');

dbms_output.put_line(v1);
   
   -- debemos poner el tipo adecuado
v1 := json1.get_number('edad');

dbms_output.put_line(v1);

v1 := json1.get_string('direccion');

dbms_output.put_line(v1);
   
   -- PAra recuperar un subdocumento
v1 := json1.get_object('direccion').get_string('calle');

dbms_output.put_line(v1);
    
   -- Ver el número de elementos en el documento  
v1 := json1.get_size;

dbms_output.put_line(v1);