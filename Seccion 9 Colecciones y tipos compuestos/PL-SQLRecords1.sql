SET SERVEROUTPUT ON

DECLARE
    TYPE empleado IS RECORD (
            nombre  VARCHAR2(100),
            salario NUMBER,
            fecha   employeees.hire_date%TYPE,
            datos   employees%rowtype
    );
    emple1 empleado;
    emple2 empleado;
BEGIN
    SELECT
        *
    INTO emple1.datos
    FROM
        employees
    WHERE
        employee_id = 100;

    emple.nombre := emple1.datos.first_name
                    || ' '
                    || emple1.datos.last_name;  

    emple1.salario := emple1.datos.salary * 0.80;
    emple1.fecha := emple1.datos.hire_date;
    dbms_output.put_line(emple1.nombre);
    dbms_output.put_line(emple1.salario);
    dbms_output.put_line(emple1.fecha);
    dbms_output.put_line(emple1.datos.first_name);
    emple2 := emple1;
    dbms_output.put_line(emple2.nombre);
END;