-- =========================================================
-- SCRIPT DIDÁTICO: WHERE
-- =========================================================
-- Este arquivo demonstra como utilizar a cláusula WHERE
-- para filtrar registros em consultas SQL.
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
    sobrenome           VARCHAR2(50),
    salario             NUMBER(10,2),
    percentual_comissao NUMBER(5,2),
    data_admissao       DATE
);

-- ---------------------------------------------------------
-- INSERÇÃO DE DADOS (exemplo)
-- ---------------------------------------------------------
INSERT INTO funcionarios VALUES (1, 'Ana',   'Silva',     3000, 0.10, DATE '2020-01-10');
INSERT INTO funcionarios VALUES (2, 'Bruno', 'Souza',     4500, NULL, DATE '2019-03-15');
INSERT INTO funcionarios VALUES (3, 'Carlos', 'Oliveira',  6000, 0.15, DATE '2018-07-22');
INSERT INTO funcionarios VALUES (4, 'Daniel','Lima',     4500, NULL, DATE '2021-11-01');
INSERT INTO funcionarios VALUES (5, 'Eduardo','Pereira', 8000, 0.20, DATE '2017-05-30');
COMMIT;
*/


-- =========================================================
-- WHERE: exemplos práticos
-- =========================================================


-- ---------------------------------------------------------
-- Filtro simples com operador de comparação
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
WHERE salario > 4000;


-- ---------------------------------------------------------
-- Utilizando operadores de comparação
-- =  !=  <>  >  <  >=  <=
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
WHERE salario >= 4500;


-- ---------------------------------------------------------
-- Utilizando operadores lógicos (AND / OR)
-- ---------------------------------------------------------
SELECT nome, salario, percentual_comissao
FROM funcionarios
WHERE salario >= 4000
  AND percentual_comissao IS NOT NULL;


SELECT nome, salario
FROM funcionarios
WHERE salario < 4000
   OR percentual_comissao IS NOT NULL;


-- ---------------------------------------------------------
-- Utilizando operador lógico NOT
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
WHERE NOT salario > 5000;


-- ---------------------------------------------------------
-- Trabalhando com valores NULL
-- ---------------------------------------------------------
SELECT nome, percentual_comissao
FROM funcionarios
WHERE percentual_comissao IS NULL;


SELECT nome, percentual_comissao
FROM funcionarios
WHERE percentual_comissao IS NOT NULL;


-- ---------------------------------------------------------
-- Utilizando IN (múltiplos valores)
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
WHERE salario IN (3000, 4500);


-- ---------------------------------------------------------
-- Utilizando NOT IN
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
WHERE salario NOT IN (3000, 4500);


-- ---------------------------------------------------------
-- Utilizando BETWEEN (intervalo de valores)
-- ---------------------------------------------------------
SELECT nome, salario
FROM funcionarios
WHERE salario BETWEEN 4000 AND 7000;


-- ---------------------------------------------------------
-- Utilizando LIKE (filtros com texto)
-- ---------------------------------------------------------
-- Começa com 'A'
SELECT nome
FROM funcionarios
WHERE nome LIKE 'A%';


-- Termina com 'a'
SELECT nome
FROM funcionarios
WHERE nome LIKE '%a';


-- Contém 'an'
SELECT nome
FROM funcionarios
WHERE nome LIKE '%an%';


-- ---------------------------------------------------------
-- Utilizando datas no WHERE
-- ---------------------------------------------------------
SELECT nome, data_admissao
FROM funcionarios
WHERE data_admissao >= DATE '2020-01-01';


-- ---------------------------------------------------------
-- Comparação combinando múltiplas condições
-- ---------------------------------------------------------
SELECT nome, salario, percentual_comissao
FROM funcionarios
WHERE (salario >= 4500 AND percentual_comissao IS NOT NULL)
   OR salario >= 8000;
