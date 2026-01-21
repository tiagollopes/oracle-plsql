-- =========================================================
-- FUNÇÕES SINGLE ROW
-- =========================================================
-- Funções Single Row atuam em UMA linha por vez e retornam
-- UM valor para cada linha processada.
--
-- Este script demonstra funções:
-- - de caracteres
-- - numéricas
-- - de datas
-- - de conversão
-- =========================================================


/*
-- ---------------------------------------------------------
-- CRIAÇÃO DA TABELA (exemplo)
-- ---------------------------------------------------------
CREATE TABLE funcionarios (
    id_funcionario NUMBER,
    nome            VARCHAR2(50),
    sobrenome       VARCHAR2(50),
    cargo           VARCHAR2(50),
    salario         NUMBER(10,2),
    data_admissao   DATE
);

-- ---------------------------------------------------------
-- INSERÇÃO DE DADOS (exemplo)
-- ---------------------------------------------------------
INSERT INTO funcionarios VALUES (1, 'Ana',    'Silva',    'President', 8000, DATE '2018-01-10');
INSERT INTO funcionarios VALUES (2, 'Bruno',  'Souza',    'Manager',   6000, DATE '2019-03-15');
INSERT INTO funcionarios VALUES (3, 'Carlos',  'Oliveira', 'Developer', 4500, DATE '2020-07-22');
INSERT INTO funcionarios VALUES (4, 'Daniel', 'Lima',    'Developer', 4500, DATE '2021-11-01');
COMMIT;
*/


-- =========================================================
-- FUNÇÕES DE CONVERSÃO (MAIÚSCULO / MINÚSCULO)
-- =========================================================

-- Comparação simples (sensível a maiúsculas/minúsculas)
SELECT id_funcionario, sobrenome
FROM funcionarios
WHERE sobrenome = 'SILVA';

-- Utilizando UPPER para comparação segura
SELECT id_funcionario, sobrenome
FROM funcionarios
WHERE UPPER(sobrenome) = 'SILVA';


-- =========================================================
-- FUNÇÕES DE MANIPULAÇÃO DE CARACTERES
-- =========================================================

-- CONCAT, SUBSTR, LENGTH, INSTR
SELECT CONCAT('Curso: ', 'Introdução Oracle 19c')              AS texto_concat,
       SUBSTR('Introdução Oracle 19c', 1, 11)                  AS sub_texto,
       LENGTH('Introdução Oracle 19c')                         AS tamanho,
       INSTR('Introdução Oracle 19c', 'Oracle')                AS posicao
FROM dual;


-- LPAD e RPAD (alinhamento de texto)
SELECT nome                                       AS nome,
       LPAD(nome, 20, ' ')                        AS alinhado_direita,
       RPAD(nome, 20, ' ')                        AS alinhado_esquerda
FROM funcionarios;


-- REPLACE (substituição de texto)
SELECT cargo,
       REPLACE(cargo, 'President', 'Presidente') AS cargo_pt
FROM funcionarios
WHERE cargo = 'President';


-- Outras funções úteis de caracteres
SELECT nome,
       LOWER(nome)                               AS minusculo,
       UPPER(nome)                               AS maiusculo,
       INITCAP(nome)                             AS capitalizado,
       TRIM('  Oracle  ')                        AS texto_sem_espacos
FROM funcionarios;


-- =========================================================
-- FUNÇÕES NUMÉRICAS
-- =========================================================

-- ROUND e TRUNC
SELECT ROUND(45.923, 2) AS arredondado,
       ROUND(45.923, 0) AS arredondado_0
FROM dual;

SELECT TRUNC(45.923, 2) AS truncado,
       TRUNC(45.923, 0) AS truncado_0
FROM dual;


-- MOD, ABS, SQRT
SELECT MOD(1300, 600) AS resto,
       ABS(-9)        AS absoluto,
       SQRT(9)        AS raiz
FROM dual;


-- =========================================================
-- FUNÇÕES DE DATA
-- =========================================================

-- Data e hora atual do servidor
SELECT SYSDATE
FROM dual;


-- Cálculos com datas (dias)
SELECT SYSDATE           AS hoje,
       SYSDATE + 30      AS mais_30_dias,
       SYSDATE - 15      AS menos_15_dias
FROM dual;


-- Diferença entre datas (em semanas)
SELECT sobrenome,
       ROUND((SYSDATE - data_admissao) / 7, 2) AS semanas_trabalhadas
FROM funcionarios;


-- MONTHS_BETWEEN
SELECT nome,
       ROUND(MONTHS_BETWEEN(SYSDATE, data_admissao), 2) AS meses_trabalhados
FROM funcionarios;


-- ADD_MONTHS, NEXT_DAY, LAST_DAY
SELECT SYSDATE                             AS hoje,
       ADD_MONTHS(SYSDATE, 3)              AS mais_3_meses,
       NEXT_DAY(SYSDATE, 'SEXTA-FEIRA')    AS proxima_sexta,
       LAST_DAY(SYSDATE)                   AS ultimo_dia_mes
FROM dual;


-- ROUND e TRUNC com datas
SELECT SYSDATE,
       ROUND(SYSDATE, 'MONTH') AS arred_mes,
       ROUND(SYSDATE, 'YEAR')  AS arred_ano,
       TRUNC(SYSDATE, 'MONTH') AS trunc_mes,
       TRUNC(SYSDATE, 'YEAR')  AS trunc_ano
FROM dual;


-- =========================================================
-- FUNÇÕES DE CONVERSÃO
-- =========================================================

-- TO_CHAR (data para texto)
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH24:MI:SS') AS data_formatada
FROM dual;


-- TO_CHAR com número
SELECT TO_CHAR(12345.67, '99,999.99') AS numero_formatado
FROM dual;
