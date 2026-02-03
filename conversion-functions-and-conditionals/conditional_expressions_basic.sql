-- =========================================================
-- SCRIPT DIDÁTICO: EXPRESSÕES CONDICIONAIS
-- =========================================================
-- Este arquivo demonstra o uso básico de
-- expressões condicionais no Oracle SQL.
--
-- Exemplos comuns:
-- CASE
-- NVL
-- NVL2
-- DECODE
--
-- A tabela e os dados abaixo estão apenas como REFERÊNCIA
-- (comentados).
-- =========================================================

/*
-- ---------------------------------------------------------
-- CRIAÇÃO DA TABELA (exemplo)
-- ---------------------------------------------------------
CREATE TABLE funcionarios (
    id_funcionario      NUMBER,
    nome                VARCHAR2(50),
    salario             NUMBER(10,2),
    percentual_comissao NUMBER(5,2),
    data_admissao       DATE
);

-- ---------------------------------------------------------
-- INSERÇÃO DE DADOS (exemplo)
-- ---------------------------------------------------------
INSERT INTO funcionarios VALUES (1, 'Ana',    3000, 0.10, DATE '2020-01-10');
INSERT INTO funcionarios VALUES (2, 'Bruno',  4500, NULL, DATE '2019-03-15');
INSERT INTO funcionarios VALUES (3, 'Carlos', 6000, 0.15, DATE '2018-07-22');
INSERT INTO funcionarios VALUES (4, 'Daniel', 4500, NULL, DATE '2021-11-01');
COMMIT;
*/

-- ---------------------------------------------------------
-- CASE: classificação por faixa salarial
-- ---------------------------------------------------------
SELECT
    id_funcionario,
    nome,
    salario,
    CASE
        WHEN salario < 4000 THEN 'SALÁRIO BAIXO'
        WHEN salario BETWEEN 4000 AND 6000 THEN 'SALÁRIO MÉDIO'
        ELSE 'SALÁRIO ALTO'
    END AS classificacao_salario
FROM funcionarios;

-- ---------------------------------------------------------
-- CASE: cálculo de bônus baseado no salário
-- ---------------------------------------------------------
SELECT
    nome,
    salario,
    CASE
        WHEN salario >= 6000 THEN salario * 0.10
        WHEN salario >= 4000 THEN salario * 0.05
        ELSE 0
    END AS bonus
FROM funcionarios;

-- ---------------------------------------------------------
-- NVL: tratando valores NULL
-- ---------------------------------------------------------
SELECT
    nome,
    percentual_comissao,
    NVL(percentual_comissao, 0) AS comissao_tratada
FROM funcionarios;

-- ---------------------------------------------------------
-- NVL2: verifica se o valor é NULL ou não
-- ---------------------------------------------------------
SELECT
    nome,
    NVL2(percentual_comissao, 'TEM COMISSÃO', 'SEM COMISSÃO') AS situacao_comissao
FROM funcionarios;

-- ---------------------------------------------------------
-- DECODE: condicional simples
-- ---------------------------------------------------------
SELECT
    nome,
    DECODE(percentual_comissao,
           NULL, 'SEM COMISSÃO',
           'COM COMISSÃO') AS comissao_status
FROM funcionarios;

-- ---------------------------------------------------------
-- CASE com DATE: tempo de empresa
-- ---------------------------------------------------------
SELECT
    nome,
    data_admissao,
    CASE
        WHEN data_admissao < DATE '2020-01-01' THEN 'FUNCIONÁRIO ANTIGO'
        ELSE 'FUNCIONÁRIO RECENTE'
    END AS tempo_empresa
FROM funcionarios;

-- ---------------------------------------------------------
-- CASE em conjunto com WHERE
-- ---------------------------------------------------------
SELECT
    nome,
    salario
FROM funcionarios
WHERE
    CASE
        WHEN salario >= 5000 THEN 1
        ELSE 0
    END = 1;
