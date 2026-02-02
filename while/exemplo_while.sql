-- =========================================================
-- Exemplo de WHILE em PL/SQL
-- Demonstra:
-- - WHILE simples
-- - WHILE com sub-while (WHILE dentro de WHILE)
-- - Uso prático com cálculos (tabuada)
-- =========================================================

SET SERVEROUTPUT ON

BEGIN
    DBMS_OUTPUT.PUT_LINE('=== WHILE simples ===');
    DECLARE
        i   NUMBER := 1;
    BEGIN
        WHILE i <= 5 LOOP
            DBMS_OUTPUT.PUT_LINE('Valor de i: ' || i);
            i := i + 1;  -- Não esqueça de incrementar!
        END LOOP;
    END;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== WHILE com sub-while ===');
    DECLARE
        linha    NUMBER := 1;
        coluna   NUMBER;
    BEGIN
        WHILE linha <= 3 LOOP
            DBMS_OUTPUT.PUT_LINE('Linha: ' || linha);

            coluna := 1;
            WHILE coluna <= 4 LOOP
                DBMS_OUTPUT.PUT_LINE(' Coluna: ' || coluna);
                coluna := coluna + 1;
            END LOOP;

            linha := linha + 1;
        END LOOP;
    END;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== Exemplo prático: tabuada ===');
    DECLARE
        numero        NUMBER;
        multiplicador NUMBER;
    BEGIN
        numero := 1;
        WHILE numero <= 3 LOOP
            DBMS_OUTPUT.PUT_LINE('Tabuada do ' || numero);

            multiplicador := 1;
            WHILE multiplicador <= 5 LOOP
                DBMS_OUTPUT.PUT_LINE(
                    numero || ' x ' || multiplicador || ' = ' || (numero * multiplicador)
                );
                multiplicador := multiplicador + 1;
            END LOOP;

            numero := numero + 1;
        END LOOP;
    END;
END;
/
