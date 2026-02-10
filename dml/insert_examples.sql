-- ==========================================================
-- EXEMPLOS DE DML: INSERT (INSERÇÃO DE DADOS)
-- ==========================================================

/* ESTRUTURA PARA TESTE:
  Crie esta tabela antes de executar os exemplos abaixo:

  CREATE TABLE clientes_teste (
      id_cliente   NUMBER PRIMARY KEY,
      nome         VARCHAR2(100),
      email        VARCHAR2(100),
      data_criacao DATE DEFAULT SYSDATE
  );
*/

-- 1. Insert Simples (Especificando todas as colunas)
INSERT INTO clientes_teste (id_cliente, nome, email, data_criacao)
VALUES (1, 'João Silva', 'joao@email.com', SYSDATE);

-- 2. Insert Omitindo Colunas (Apenas as obrigatórias ou com DEFAULT)
INSERT INTO clientes_teste (id_cliente, nome)
VALUES (2, 'Maria Oliveira');

-- 3. Insert com Formatação de Data (TO_DATE)
INSERT INTO clientes_teste (id_cliente, nome, email, data_criacao)
VALUES (3, 'Carlos Souza', 'carlos@email.com', TO_DATE('2023-10-25', 'YYYY-MM-DD'));

-- 4. Insert a partir de um SELECT (Cópia de dados)
-- Útil para migrar dados entre tabelas
INSERT INTO clientes_teste (id_cliente, nome, email)
SELECT id_cliente + 100, nome, email
FROM clientes_teste
WHERE id_cliente = 1;

-- 5. Insert Multi-Rows (Apenas em versões mais recentes do Oracle ou via subquery)
INSERT ALL
    INTO clientes_teste (id_cliente, nome) VALUES (4, 'Ana Costa')
    INTO clientes_teste (id_cliente, nome) VALUES (5, 'Pedro Rocha')
SELECT * FROM dual;

-- Importante: Em DML é necessário confirmar as alterações
COMMIT;
