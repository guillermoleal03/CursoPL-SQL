CREATE OR REPLACE TYPE producto AS OBJECT (

--Atributos
        codigo NUMBER,
        nombre VARCHAR2(100),
        precio NUMBER,

--Métodos
        MEMBER FUNCTION ver_producto RETURN VARCHAR2,
        MEMBER FUNCTION ver_precio RETURN NUMBER,
        MEMBER PROCEDURE cambiar_precio (
               pvp NUMBER
           )
);