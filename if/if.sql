-- Exemplo de IF com operadores lógicos em PL/SQL
-- Demonstra uso de:
-- - IF / ELSE / ELSIF
-- - Operadores lógicos (AND, OR, NOT)
-- - Operadores de comparação
-- - Tipos NUMBER, BOOLEAN e VARCHAR2 (STRING)

SET SERVEROUTPUT ON

DECLARE
    -- Variáveis numéricas
    idade NUMBER := 20;
    salario NUMBER := 3500;

    -- Variáveis booleanas
    eh_estudante BOOLEAN := TRUE;
    tem_ingresso BOOLEAN := FALSE;

    -- Variáveis string
    cargo VARCHAR2(20) := 'DEV';
    status_usuario VARCHAR2(20) := 'ATIVO';

BEGIN
    DBMS_OUTPUT.PUT_LINE('=== IF simples ===');
    IF idade >= 18 THEN
        DBMS_OUTPUT.PUT_LINE('Usuário é maior de idade');
    END IF;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== IF / ELSE ===');
    IF salario < 2000 THEN
        DBMS_OUTPUT.PUT_LINE('Salário baixo');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salário aceitável');
    END IF;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== IF / ELSIF / ELSE ===');
    IF idade < 13 THEN
        DBMS_OUTPUT.PUT_LINE('Criança');
    ELSIF idade < 18 THEN
        DBMS_OUTPUT.PUT_LINE('Adolescente');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Adulto');
    END IF;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== Operador lógico AND ===');
    IF idade >= 18 AND tem_ingresso THEN
        DBMS_OUTPUT.PUT_LINE('Pode entrar no evento');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Não pode entrar no evento');
    END IF;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== Operador lógico OR ===');
    IF eh_estudante OR salario < 2000 THEN
        DBMS_OUTPUT.PUT_LINE('Tem direito a benefício');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Não tem direito a benefício');
    END IF;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== Operador lógico NOT ===');
    IF NOT tem_ingresso THEN
        DBMS_OUTPUT.PUT_LINE('Usuário não possui ingresso');
    END IF;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== Comparação com STRING ===');
    IF cargo = 'DEV' THEN
        DBMS_OUTPUT.PUT_LINE('Cargo é Desenvolvedor');
    END IF;

    IF status_usuario <> 'ATIVO' THEN
        DBMS_OUTPUT.PUT_LINE('Usuário inativo');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Usuário ativo');
    END IF;

    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== Condições combinadas ===');
    IF (idade >= 18 AND status_usuario = 'ATIVO') OR eh_estudante THEN
        DBMS_OUTPUT.PUT_LINE('Acesso liberado');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Acesso negado');
    END IF;

END;
/
