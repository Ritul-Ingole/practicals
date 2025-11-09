CREATE TABLE Borrowwer(
    Roll_no NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    DateOfIssue DATE,
    NameOfBook VARCHAR2(50),
    Status CHAR(1)
);

CREATE TABLE Fine(
    Roll_no NUMBER,
    DateReturned DATE,
    Amt NUMBER
);

INSERT INTO Borrowwer VALUES(1, 'Booker', TO_DATE('2025-10-01', 'YYYY-MM-DD'), 'DBMS', 'I');
INSERT INTO Borrowwer VALUES(2, 'Sarge', TO_DATE('2025-09-18', 'YYYY-MM-DD'), 'CNS', 'I');


SET SERVEROUTPUT ON;

DECLARE 
    v_roll Borrowwer.Roll_no%TYPE := 1;
    v_book Borrowwer.NameOfBook%TYPE := 'DBMS';
    v_DateOfIssue Borrowwer.DateOfIssue%TYPE;
    v_Days NUMBER;
    v_Fine NUMBER := 0;
    fine_ex EXCEPTION;

BEGIN
    SELECT DateOfIssue
    INTO v_DateOfIssue
    FROM Borrowwer
    WHERE Roll_no = v_roll AND NameOfBook = v_book;

    v_Days := TRUNC(SYSDATE - v_DateOfIssue);

    IF v_Days BETWEEN 15 AND 30 THEN
        v_Fine := v_Days * 5;
    ELSIF v_Days > 30 THEN
        v_Fine := v_Days * 50;
    ELSE 
        v_Fine := 0;
    END IF;

    UPDATE Borrowwer
    SET Status = 'R'
    WHERE Roll_no = v_roll AND NameOfBook = v_book;
    
    IF v_Fine > 0 THEN
        INSERT INTO Fine VALUES(v_roll, SYSDATE, v_Fine);
        RAISE fine_ex;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Book returned successfully. No fine.');

EXCEPTION
    WHEN fine_ex THEN
        DBMS_OUTPUT.PUT_LINE('Fine of Rs.' || v_Fine || ' on Roll no. ' || v_roll);
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No matching record found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error occurred');
END;
