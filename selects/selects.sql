-- =========================================================
-- SCRIPT DIDÁTICO DE SELECT
-- =========================================================
-- Este arquivo demonstra os principais recursos do comando
-- SELECT utilizando apenas UMA tabela.
--
-- A tabela e os dados abaixo estão apenas como REFERÊNCIA
-- (comentados), para entendimento do exemplo.
-- =========================================================


/*
-- ---------------------------------------------------------
-- CRIAÇÃO DA TABELA (exemplo)
-- ---------------------------------------------------------
CREATE TABLE funcionarios (
    id_funcionario      NUMBER,
    nome                VARCHAR2(50),
    sobrenome           VARCHAR2(50),
    salario             NUMBER(10,2),
    percentual_comissao NUMBER(5,2),
    data_admissao       DATE
);

-- ---------------------------------------------------------
-- INSERÇÃO DE DADOS (exemplo)
-- ---------------------------------------------------------
INSERT INTO funcionarios VALUES (1, 'Ana',   'Silva',  3000, 0.10, DATE '2020-01-10');
INSERT INTO funcionarios VALUES (2, 'Bruno', 'Souza',  4500, NULL, DATE '2019-03-15');
INSERT INTO funcionarios VALUES (3, 'Carlos', 'Oliveira', 6000, 0.15, DATE '2018-07-22');
INSERT INTO funcionarios VALUES (4, 'Daniel','Lima',  4500, NULL, DATE '2021-11-01');
COMMIT;
*/


-- =========================================================
-- SELECT: exemplos práticos
-- =========================================================


-- ---------------------------------------------------------
-- Selecionando TODAS as colunas da tabela
-- ---------------------------------------------------------
SELECT *
FROM funcionarios;


-- ---------------------------------------------------------
-- Selecionando colunas específicas
-- ---------------------------------------------------------
SELECT nome, sobrenome, salario
FROM funcionarios;


-- ---------------------------------------------------------
-- Operadores aritméticos
-- Exemplo: aumento de 10% no salário
-- ---------------------------------------------------------
SELECT nome,
       salario,
       salario * 1.10 AS salario_com_aumento
FROM funcionarios;


-- ---------------------------------------------------------
-- Precedência de operadores
-- Multiplicação ocorre antes da soma
-- ---------------------------------------------------------
SELECT salario,
       salario + 500 * 1.10 AS calculo_sem_parenteses
FROM funcionarios;


-- ---------------------------------------------------------
-- Uso de parênteses para alterar a precedência
-- ---------------------------------------------------------
SELECT salario,
       (salario + 500) * 1.10 AS calculo_com_parenteses
FROM funcionarios;


-- ---------------------------------------------------------
-- Trabalhando com valores NULL
-- ---------------------------------------------------------
SELECT nome,
       percentual_comissao
FROM funcionarios;


-- ---------------------------------------------------------
-- NULL em expressões aritméticas
-- Qualquer cálculo com NULL resulta em NULL
-- ---------------------------------------------------------
SELECT nome,
       percentual_comissao,
       salario * percentual_comissao AS valor_comissao
FROM funcionarios;


-- ---------------------------------------------------------
-- Alias de colunas
-- ---------------------------------------------------------
SELECT nome        AS nome_funcionario,
       salario     AS salario
FROM funcionarios;


-- ---------------------------------------------------------
-- Alias com aspas (permite espaços e caracteres especiais)
-- ---------------------------------------------------------
SELECT nome        "Nome",
       salario     "Salário (R$)"
FROM funcionarios;


-- ---------------------------------------------------------
-- Concatenação de strings (||)
-- ---------------------------------------------------------
SELECT nome || ' ' || sobrenome AS nome_completo
FROM funcionarios;


-- ---------------------------------------------------------
-- Concatenação com texto fixo e data
-- ---------------------------------------------------------
SELECT nome || ' - Admitido em: ' || data_admissao AS descricao
FROM funcionarios;


-- ---------------------------------------------------------
-- Operador alternativo de aspas (q'[ ]')
-- ---------------------------------------------------------
SELECT nome || q'[ ganha o salário de R$ ]' || salario AS mensagem
FROM funcionarios;


-- ---------------------------------------------------------
-- Eliminando valores duplicados com DISTINCT
-- ---------------------------------------------------------
SELECT DISTINCT salario
FROM funcionarios;
