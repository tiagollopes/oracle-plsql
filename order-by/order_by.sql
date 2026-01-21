-- =========================================================
-- SCRIPT DIDÁTICO: ORDER BY
-- =========================================================
-- Este arquivo demonstra as principais formas de ordenação
-- de dados utilizando a cláusula ORDER BY.
--
-- A tabela e os dados abaixo estão apenas como REFERÊNCIA
-- (comentados), para que o leitor possa testar os exemplos.
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
INSERT INTO funcionarios VALUES (1, 'Ana',    'Silva',    3000, 0.10, DATE '2020-01-10');
INSERT INTO funcionarios VALUES (2, 'Bruno',  'Souza',    4500, NULL, DATE '2019-03-15');
INSERT INTO funcionarios VALUES (3, 'Carlos',  'Oliveira', 6000, 0.15, DATE '2018-07-22');
INSERT INTO funcionarios VALUES (4, 'Daniel', 'Lima',    4500, NULL, DATE '2021-11-01');
INSERT INTO funcionarios VALUES (5, 'Eduardo','Pereira', 8000, 0.20, DATE '2017-05-30');
COMMIT;
*/


-- =========================================================
-- ORDER BY: exemplos práticos
-- =========================================================


-- ---------------------------------------------------------
-- Ordenação padrão (ASC - crescente)
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
ORDER BY salario;


-- ---------------------------------------------------------
-- Ordenação explícita crescente (ASC)
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
ORDER BY salario ASC;


-- ---------------------------------------------------------
-- Ordenação decrescente (DESC)
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
ORDER BY salario DESC;


-- ---------------------------------------------------------
-- Ordenação por texto (ordem alfabética)
-- ---------------------------------------------------------
SELECT nome, sobrenome
FROM funcionarios
ORDER BY nome;


-- ---------------------------------------------------------
-- Ordenação por múltiplas colunas
-- Primeiro salário (DESC), depois nome (ASC)
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
ORDER BY salario DESC, nome ASC;


-- ---------------------------------------------------------
-- ORDER BY usando posição da coluna no SELECT
-- (não recomendado em produção, apenas didático)
-- ---------------------------------------------------------
SELECT nome, salario, data_admissao
FROM funcionarios
ORDER BY 2 DESC;


-- ---------------------------------------------------------
-- ORDER BY usando alias de coluna
-- ---------------------------------------------------------
SELECT nome,
       salario * 1.10 AS salario_com_aumento
FROM funcionarios
ORDER BY salario_com_aumento DESC;


-- ---------------------------------------------------------
-- ORDER BY com expressão
-- ---------------------------------------------------------
SELECT nome,
       salario,
       salario + NVL(percentual_comissao, 0) * salario AS total_recebido
FROM funcionarios
ORDER BY total_recebido DESC;


-- ---------------------------------------------------------
-- ORDER BY com tratamento de valores NULL
-- ---------------------------------------------------------
-- NULLS LAST: valores NULL ficam por último
SELECT nome, percentual_comissao
FROM funcionarios
ORDER BY percentual_comissao NULLS LAST;


-- NULLS FIRST: valores NULL ficam no início
SELECT nome, percentual_comissao
FROM funcionarios
ORDER BY percentual_comissao NULLS FIRST;


-- ---------------------------------------------------------
-- ORDER BY com datas
-- ---------------------------------------------------------
SELECT nome, data_admissao
FROM funcionarios
ORDER BY data_admissao;


-- ---------------------------------------------------------
-- ORDER BY combinando filtros (WHERE + ORDER BY)
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
WHERE salario >= 4500
ORDER BY salario DESC;


-- ---------------------------------------------------------
-- ORDER BY com funções
-- ---------------------------------------------------------
-- Ordenação ignorando maiúsculas/minúsculas
SELECT nome
FROM funcionarios
ORDER BY UPPER(nome);


-- ---------------------------------------------------------
-- ORDER BY com CASE (ordenar por regra customizada)
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
ORDER BY
    CASE
        WHEN salario >= 7000 THEN 1
        WHEN salario >= 4500 THEN 2
        ELSE 3
    END;
