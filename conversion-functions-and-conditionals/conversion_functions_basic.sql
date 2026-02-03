-- =========================================================
-- SCRIPT DIDÁTICO: FUNÇÕES DE CONVERSÃO
-- =========================================================
-- Este arquivo demonstra o uso básico de funções
-- de conversão de tipos no Oracle SQL.
--
-- Exemplos comuns:
-- TO_CHAR, TO_NUMBER e TO_DATE
--
-- A tabela e os dados abaixo estão apenas como REFERÊNCIA
-- (comentados).
-- =========================================================

/*
-- ---------------------------------------------------------
-- CRIAÇÃO DA TABELA (exemplo)
-- ---------------------------------------------------------
CREATE TABLE funcionarios (
    id_funcionario NUMBER,
    nome            VARCHAR2(50),
    salario         NUMBER(10,2),
    data_admissao   DATE
);

-- ---------------------------------------------------------
-- INSERÇÃO DE DADOS (exemplo)
-- ---------------------------------------------------------
INSERT INTO funcionarios VALUES (1, 'Ana',    3000.50, DATE '2020-01-10');
INSERT INTO funcionarios VALUES (2, 'Bruno',  4500.00, DATE '2019-03-15');
INSERT INTO funcionarios VALUES (3, 'Carlos', 6000.75, DATE '2018-07-22');
COMMIT;
*/

-- ---------------------------------------------------------
-- TO_CHAR: convertendo DATE para TEXTO
-- ---------------------------------------------------------
SELECT
    id_funcionario,
    nome,
    TO_CHAR(data_admissao, 'DD/MM/YYYY') AS data_admissao_formatada
FROM funcionarios;

-- ---------------------------------------------------------
-- TO_CHAR: convertendo DATE com nome do mês
-- ---------------------------------------------------------
SELECT
    nome,
    TO_CHAR(data_admissao, 'DD "de" MONTH "de" YYYY') AS data_formatada
FROM funcionarios;

-- ---------------------------------------------------------
-- TO_CHAR: convertendo NUMBER para TEXTO (moeda)
-- ---------------------------------------------------------
SELECT
    nome,
    TO_CHAR(salario, 'L9G999D99') AS salario_formatado
FROM funcionarios;

-- ---------------------------------------------------------
-- TO_CHAR: número com casas decimais fixas
-- ---------------------------------------------------------
SELECT
    nome,
    TO_CHAR(salario, '9999990.00') AS salario_texto
FROM funcionarios;

-- ---------------------------------------------------------
-- TO_NUMBER: convertendo TEXTO para NUMBER
-- ---------------------------------------------------------
SELECT
    nome,
    salario,
    salario + TO_NUMBER('1000') AS salario_com_bonus
FROM funcionarios;

-- ---------------------------------------------------------
-- TO_NUMBER: usando valor convertido em cálculo
-- ---------------------------------------------------------
SELECT
    nome,
    salario,
    salario + TO_NUMBER('500.50') AS salario_ajustado
FROM funcionarios;

-- ---------------------------------------------------------
-- TO_DATE: convertendo TEXTO para DATE
-- ---------------------------------------------------------
SELECT
    nome,
    data_admissao,
    TO_DATE('01/01/2022', 'DD/MM/YYYY') AS data_referencia
FROM funcionarios;

-- ---------------------------------------------------------
-- TO_DATE: comparando DATE com valor convertido
-- ---------------------------------------------------------
SELECT
    nome,
    data_admissao
FROM funcionarios
WHERE data_admissao < TO_DATE('01/01/2020', 'DD/MM/YYYY');
