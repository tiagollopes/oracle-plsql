-- Exemplo de bloco básico em PL/SQL
-- Estrutura: DECLARE | BEGIN | EXCEPTION | END;

DECLARE
    v_message VARCHAR2(50) := 'Hello, PL/SQL!';
    v_number  NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_message);
    DBMS_OUTPUT.PUT_LINE('Number: ' || v_number);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/
