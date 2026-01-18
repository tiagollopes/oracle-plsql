-- Exemplo de operadores em PL/SQL

DECLARE
    a NUMBER := 10;
    b NUMBER := 3;
BEGIN
    -- ======================
    -- Operadores aritméticos
    -- ======================
    DBMS_OUTPUT.PUT_LINE('Soma: ' || (a + b));
    DBMS_OUTPUT.PUT_LINE('Subtração: ' || (a - b));
    DBMS_OUTPUT.PUT_LINE('Multiplicação: ' || (a * b));
    DBMS_OUTPUT.PUT_LINE('Divisão: ' || (a / b));
    DBMS_OUTPUT.PUT_LINE('Resto (MOD): ' || MOD(a, b));

    -- ======================
    -- Operadores relacionais
    -- ======================
    DBMS_OUTPUT.PUT_LINE('a = b: ' || CASE WHEN a = b THEN 'TRUE' ELSE 'FALSE' END);
    DBMS_OUTPUT.PUT_LINE('a != b: ' || CASE WHEN a != b THEN 'TRUE' ELSE 'FALSE' END);
    DBMS_OUTPUT.PUT_LINE('a > b: ' || CASE WHEN a > b THEN 'TRUE' ELSE 'FALSE' END);
    DBMS_OUTPUT.PUT_LINE('a < b: ' || CASE WHEN a < b THEN 'TRUE' ELSE 'FALSE' END);
    DBMS_OUTPUT.PUT_LINE('a >= b: ' || CASE WHEN a >= b THEN 'TRUE' ELSE 'FALSE' END);
    DBMS_OUTPUT.PUT_LINE('a <= b: ' || CASE WHEN a <= b THEN 'TRUE' ELSE 'FALSE' END);

    -- ======================
    -- Operadores lógicos
    -- ======================
    DBMS_OUTPUT.PUT_LINE(
        'AND: ' ||
        CASE WHEN a > 5 AND b < 5 THEN 'TRUE' ELSE 'FALSE' END
    );

    DBMS_OUTPUT.PUT_LINE(
        'OR: ' ||
        CASE WHEN a > 20 OR b < 5 THEN 'TRUE' ELSE 'FALSE' END
    );

    DBMS_OUTPUT.PUT_LINE(
        'NOT: ' ||
        CASE WHEN NOT (a = b) THEN 'TRUE' ELSE 'FALSE' END
    );
END;
/
