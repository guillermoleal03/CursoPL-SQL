SET SERVEROUTPUT ON

DECLARE
    valor     NUMBER;
    resultado NUMBER;
BEGIN
    valor := 10;
    resultado := MOD(valor, 2);
    IF resultado = 0 THEN
        dbms_output.put_line('PAR');
    ELSE
        dbms_output.put_line('IMPAR');
    END IF;

END;

SET SERVEROUTPUT ON

DECLARE
    tipo_producto CHAR(1);
BEGIN
    tipo_producto := upper('A');
    IF tipo_producto = 'A' THEN
        dbms_output.put_line('ELECTR�NICA');
    ELSIF tipo_producto = 'B' THEN
        dbms_output.put_line('INFORM�TICA');
    ELSIF tipo_producto = 'C' THEN
        dbms_output.put_line('ROPA');
    ELSIF tipo_producto = 'D' THEN
        dbms_output.put_line('M�SICA');
    ELSIF tipo_producto = 'E' THEN
        dbms_output.put_line('LIBRO');
    ELSE
        dbms_output.put_line('EL C�DIGO ES INCORRECTO');
    END IF;

END;