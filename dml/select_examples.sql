-- ==========================================================
-- EXEMPLOS DE DQL: SELECT (CONSULTA DE DADOS)
-- ==========================================================

/* ESTRUTURA PARA TESTE:
  CREATE TABLE departamentos (
      id_dept   NUMBER PRIMARY KEY,
      nome_dept VARCHAR2(50)
  );

  CREATE TABLE funcionarios (
      id_func      NUMBER PRIMARY KEY,
      nome         VARCHAR2(100),
      salario      NUMBER(10,2),
      data_admissao DATE,
      id_dept      NUMBER,
      CONSTRAINT fk_dept FOREIGN KEY (id_dept) REFERENCES departamentos(id_dept)
  );

-- ==========================================================
-- SCRIPT PARA POPULAR TABELAS DE TESTE (DEPT E FUNC)
-- ==========================================================

-- 1. Limpeza prévia (Opcional - cuidado em ambientes reais)
--DELETE FROM funcionarios; --opcional
--DELETE FROM departamentos; --opcional

-- 2. Inserts na tabela de DEPARTAMENTOS
INSERT INTO departamentos (id_dept, nome_dept) VALUES (10, 'Tecnologia da Informação');
INSERT INTO departamentos (id_dept, nome_dept) VALUES (20, 'Recursos Humanos');
INSERT INTO departamentos (id_dept, nome_dept) VALUES (30, 'Financeiro');
INSERT INTO departamentos (id_dept, nome_dept) VALUES (40, 'Vendas');
INSERT INTO departamentos (id_dept, nome_dept) VALUES (50, 'Marketing');

-- 3. Inserts na tabela de FUNCIONÁRIOS
-- Usando diferentes datas e salários para testar filtros e ordenação

INSERT INTO funcionarios (id_func, nome, salario, data_admissao, id_dept)
VALUES (1, 'Tiago Lopes', 8500.00, TO_DATE('2020-01-15', 'YYYY-MM-DD'), 10);

INSERT INTO funcionarios (id_func, nome, salario, data_admissao, id_dept)
VALUES (2, 'Maria Silva', 4200.50, TO_DATE('2022-05-20', 'YYYY-MM-DD'), 20);

INSERT INTO funcionarios (id_func, nome, salario, data_admissao, id_dept)
VALUES (3, 'João Pereira', 3100.00, TO_DATE('2023-02-10', 'YYYY-MM-DD'), 10);

INSERT INTO funcionarios (id_func, nome, salario, data_admissao, id_dept)
VALUES (4, 'Ana Costa', 5500.00, TO_DATE('2021-11-12', 'YYYY-MM-DD'), 30);

INSERT INTO funcionarios (id_func, nome, salario, data_admissao, id_dept)
VALUES (5, 'Carlos Souza', 2800.00, TO_DATE('2023-08-05', 'YYYY-MM-DD'), 40);

INSERT INTO funcionarios (id_func, nome, salario, data_admissao, id_dept)
VALUES (6, 'Luciana Melo', 9200.00, TO_DATE('2019-03-25', 'YYYY-MM-DD'), 10);

INSERT INTO funcionarios (id_func, nome, salario, data_admissao, id_dept)
VALUES (7, 'Ricardo Oliveira', 3900.00, TO_DATE('2022-10-30', 'YYYY-MM-DD'), 30);

-- Funcionário sem departamento para testar LEFT JOIN
INSERT INTO funcionarios (id_func, nome, salario, data_admissao, id_dept)
VALUES (8, 'Bruno Santos', 4500.00, SYSDATE, NULL);

-- 4. Confirmar as inserções
COMMIT;

-- Verificação rápida
SELECT * FROM departamentos;
SELECT * FROM funcionarios;
*/

-- 1. CONSULTAS BÁSICAS
-- ----------------------------------------------------------

-- Selecionar todas as colunas
SELECT * FROM funcionarios;

-- Selecionar colunas específicas e usar Alias (apelidos)
SELECT nome AS "Nome do Colaborador", salario FROM funcionarios;

-- Consultar valores únicos (sem repetição)
SELECT DISTINCT id_dept FROM funcionarios;


-- 2. FILTROS (WHERE)
-- ----------------------------------------------------------

-- Filtro simples com operadores (>, <, =, !=)
SELECT nome, salario FROM funcionarios WHERE salario > 3000;

-- Filtro com múltiplas condições (AND, OR)
SELECT * FROM funcionarios WHERE id_dept = 10 AND salario <= 5000;

-- Filtro de faixas (BETWEEN) e listas (IN)
SELECT * FROM funcionarios WHERE data_admissao BETWEEN '01/01/2023' AND '31/12/2023';
SELECT * FROM funcionarios WHERE id_dept IN (10, 20, 30);

-- Busca por texto parcial (LIKE)
-- % representa qualquer quantidade de caracteres
SELECT nome FROM funcionarios WHERE nome LIKE 'MARIA%';


-- 3. ORDENAÇÃO E LIMITAÇÃO
-- ----------------------------------------------------------

-- Ordenar por salário (Crescente: ASC, Decrescente: DESC)
SELECT nome, salario FROM funcionarios ORDER BY salario DESC;

-- Limitar quantidade de linhas (Oracle 12c ou superior)
SELECT nome FROM funcionarios ORDER BY nome FETCH FIRST 5 ROWS ONLY;


-- 4. FUNÇÕES DE AGREGAÇÃO E AGRUPAMENTO
-- ----------------------------------------------------------

-- Contar, Somar, Média, Máximo e Mínimo
SELECT COUNT(*) AS total_func,
       SUM(salario) AS folha_pagamento,
       AVG(salario) AS media_salarial,
       MAX(salario) AS maior_salario
FROM funcionarios;

-- Agrupamento por departamento (GROUP BY)
SELECT id_dept, COUNT(*) AS qtd_funcionarios
FROM funcionarios
GROUP BY id_dept;

-- Filtrar grupos (HAVING) - Ex: Departamentos com mais de 5 funcionários
SELECT id_dept, COUNT(*)
FROM funcionarios
GROUP BY id_dept
HAVING COUNT(*) > 5;


-- 5. JOINS (JUNÇÃO DE TABELAS)
-- ----------------------------------------------------------

-- INNER JOIN: Retorna apenas registros que existem em ambas as tabelas
SELECT f.nome, d.nome_dept
FROM funcionarios f
INNER JOIN departamentos d ON f.id_dept = d.id_dept;

-- LEFT JOIN: Retorna todos os funcionários, mesmo os sem departamento
SELECT f.nome, d.nome_dept
FROM funcionarios f
LEFT JOIN departamentos d ON f.id_dept = d.id_dept;


-- 6. OPERAÇÃO COM NULL
-- ----------------------------------------------------------

-- Verificar se um campo é nulo
SELECT nome FROM funcionarios WHERE id_dept IS NULL;

-- Substituir valor nulo na exibição (NVL)
SELECT nome, NVL(id_dept, 0) AS depto_corrigido FROM funcionarios;
