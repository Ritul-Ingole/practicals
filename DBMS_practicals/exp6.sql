CREATE TABLE O_ROLLCALL(
    roll_no NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    attendence VARCHAR2(30)
);

CREATE TABLE N_ROLLCALL(
    roll_no NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    attendence VARCHAR2(30)
);


INSERT INTO O_ROLLCALL VALUES('1', 'Booker', 'P');
INSERT INTO O_ROLLCALL VALUES('2', 'Sarge', 'A');
INSERT INTO O_ROLLCALL VALUES('3', 'Ritul', 'P');

INSERT INTO N_ROLLCALL VALUES('1', 'Sarge', 'A');
INSERT INTO N_ROLLCALL VALUES('2', 'Ritul', 'P');
INSERT INTO N_ROLLCALL VALUES('3', 'Sarang', 'A');
INSERT INTO N_ROLLCALL VALUES('4', 'Pritam', 'P');



SET SERVEROUTPUT ON;

DECLARE
    CURSOR cur_merge(p_roll O_ROLLCALL.roll_no%TYPE) IS
        SELECT COUNT(*) AS cnt FROM O_ROLLCALL WHERE p_roll = roll_no;
    v_roll N_ROLLCALL.roll_no%TYPE;
    v_name N_ROLLCALL.name%TYPE;
    v_att N_ROLLCALL.attendence%TYPE;
    v_exists NUMBER;

BEGIN
    FOR rec IN(SELECT * FROM N_ROLLCALL) LOOP
        OPEN cur_merge(rec.roll_no);
        FETCH cur_merge INTO v_exists;
        CLOSE cur_merge;

        IF v_exists = 0 THEN
            INSERT INTO O_ROLLCALL VALUES(rec.roll_no, rec.name, rec.attendence);
            DBMS_OUTPUT.PUT_LINE('Inserted Roll no.:' || rec.roll_no || '-' || rec.name);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Roll no. ' || rec.roll_no || ' already exists.');
        END IF;
    END LOOP;
END;

SELECT * FROM O_ROLLCALL;
SELECT * FROM O_ROLLCALL ORDER BY roll_no;