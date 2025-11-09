CREATE TABLE Areas(
    Radius NUMBER,
    Area NUMBER
);




SET SERVEROUTPUT ON;

DECLARE 
    r NUMBER := 5;
    a NUMBER;
    invalid_radius EXCEPTION;

BEGIN
    WHILE r <= 9 LOOP
        IF r < 0 THEN
            RAISE invalid_radius;
        END IF;

        a:= 3.14 * r * r;
        INSERT INTO Areas VALUES(r, a);
        DBMS_OUTPUT.PUT_LINE('Area of raduis ' || r || ' is ' || a);

        r:= r+1;
    END LOOP;

EXCEPTION
    WHEN invalid_radius THEN
        DBMS_OUTPUT.PUT_LINE('Radius cannot be negative');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error occured');
END;