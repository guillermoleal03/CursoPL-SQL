--Practica 1
DECLARE
    x NUMBER;
    z NUMBER;
BEGIN
    x := 1;
    z := 1;
    LOOP
        EXIT WHEN x = 11;
        dbms_output.put_line('Tabla de multiplicar del :' || x);
        LOOP
            EXIT WHEN z = 11;
            dbms_output.put_line(x * z);
            z := z + 1;
        END LOOP;

        z := 0;
        x := x + 1;
    END LOOP;

END;
/

DECLARE
    x NUMBER;
    z NUMBER;
BEGIN
    x := 1;
    z := 1;
    WHILE x < 11 LOOP
        dbms_output.put_line('Tabla de multiplicar del :' || x);
        WHILE z < 11 LOOP
            dbms_output.put_line(x * z);
            z := z + 1;
        END LOOP;

        z := 0;
        x := x + 1;
    END LOOP;

END;

--Practica 2
DECLARE
    frase          VARCHAR2(100);
    limite         NUMBER;
    contador       NUMBER;
    frase_al_reves VARCHAR2(100);
BEGIN
    frase := 'ESTO ES UNA PRUEBA DE FRSE';
    limite := length(frase);
    WHILE limite > 0 LOOP
        frase_al_reves := frase_al_reves
                          || substr(frase, limite, 1);
        limite := limite - 1;
    END LOOP;

    dbms_output.put_line(frase_al_reves);
END;

--Practica 3
DECLARE
    frase          VARCHAR2(100);
    limite         NUMBER;
    contador       NUMBER;
    frase_al_reves VARCHAR2(100);
BEGIN
    frase := 'ESTO ES UNA PRUEBA DE XRSE';
    limite := length(frase);
    WHILE limite > 0 LOOP
        EXIT WHEN upper((substr(frase, limite, 1))) = 'X';
        frase_al_reves := frase_al_reves
                          || substr(frase, limite, 1);
        limite := limite - 1;
    END LOOP;

    dbms_output.put_line(frase_al_reves);
END;

--Practica 4
DECLARE
    nombre     VARCHAR2(100);
    asteriscos VARCHAR2(100);
BEGIN
    nombre := 'ALBERTO';
    FOR i IN 1..length(nombre) LOOP
        asteriscos := asteriscos || '*';
    END LOOP;

    dbms_output.put_line(nombre
                         || '-->'
                         || asteriscos);
END;

--Practica 5
DECLARE
    inicio NUMBER;
    final  NUMBER;
BEGIN
    inicio := 10;
    final := 200;
    FOR i IN inicio..final LOOP
        IF MOD(i, 4) = 0 THEN
            dbms_output.put_line(i);
        END IF;
    END LOOP;

END;