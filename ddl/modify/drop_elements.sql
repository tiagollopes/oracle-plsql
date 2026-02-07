-- ==========================================================
-- EXEMPLOS DE DDL: DROP E LIMPEZA DE OBJETOS
-- ==========================================================

-- ----------------------------------------------------------
-- 1. EXCLUIR ELEMENTOS DE UMA TABELA (ALTER TABLE)
-- ----------------------------------------------------------

-- Excluir uma coluna específica
ALTER TABLE clientes DROP COLUMN email;

-- Excluir múltiplas colunas simultaneamente
ALTER TABLE pedidos DROP (data_pedido, valor_total);

-- Excluir uma Constraint (Restrição) pelo nome
ALTER TABLE pedidos DROP CONSTRAINT fk_cliente;

-- Marcar coluna como UNUSED (Performance em tabelas grandes)
-- A coluna é removida logicamente e o espaço liberado depois
ALTER TABLE clientes SET UNUSED (nome_completo);
ALTER TABLE clientes DROP UNUSED COLUMNS;


-- ----------------------------------------------------------
-- 2. EXCLUIR A TABELA INTEIRA (DROP TABLE)
-- ----------------------------------------------------------

-- Exclusão simples (vai para a lixeira/Recycle Bin)
DROP TABLE clientes;

-- Excluir permanentemente (sem passar pela lixeira)
DROP TABLE pedidos PURGE;

-- Excluir tabela e todas as constraints de integridade (FKs) que apontam para ela
DROP TABLE fornecedores CASCADE CONSTRAINTS;


-- ----------------------------------------------------------
-- 3. ESVAZIAR TABELA (TRUNCATE)
-- ----------------------------------------------------------

-- Remove todos os dados e libera o espaço, mas mantém a estrutura
-- Operação mais rápida que o DELETE e não gera undo (DML)
TRUNCATE TABLE logs_sistema;
