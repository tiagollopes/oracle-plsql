-- Exemplo de FOR em PL/SQL
-- Demonstra:
-- - FOR simples
-- - FOR com sub-for (FOR dentro de FOR)
-- - Uso prático com cálculos

SET SERVEROUTPUT ON

BEGIN
    DBMS_OUTPUT.PUT_LINE('=== FOR simples ===');
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Valor de i: ' || i);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== FOR com sub-for ===');
    FOR linha IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('Linha: ' || linha);

        FOR coluna IN 1..4 LOOP
            DBMS_OUTPUT.PUT_LINE('  Coluna: ' || coluna);
        END LOOP;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== Exemplo prático: tabuada ===');
    FOR numero IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('Tabuada do ' || numero);

        FOR multiplicador IN 1..5 LOOP
            DBMS_OUTPUT.PUT_LINE(
                numero || ' x ' || multiplicador || ' = ' || (numero * multiplicador)
            );
        END LOOP;
    END LOOP;
END;
/
