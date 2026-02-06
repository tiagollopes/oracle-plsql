-- ==========================================================
-- EXEMPLOS DE DDL: ALTER TABLE (MODIFY, ADD, DROP COLUMN)
-- ==========================================================

-- 1. Adicionar uma nova coluna a uma tabela existente
ALTER TABLE clientes ADD telefone VARCHAR2(20);

-- 2. Modificar o tipo de dado ou tamanho de uma coluna
-- Aumentando o tamanho do campo email
ALTER TABLE clientes MODIFY email VARCHAR2(250);

-- 3. Adicionar um valor padrão (DEFAULT) a uma coluna existente
ALTER TABLE pedidos MODIFY status DEFAULT 'PROCESSANDO';

-- 4. Renomear uma coluna
ALTER TABLE clientes RENAME COLUMN nome TO nome_completo;

-- 5. Excluir uma coluna (DROP COLUMN)
ALTER TABLE clientes DROP COLUMN telefone;

-- 6. Adicionar uma Constraint de Check após a criação
ALTER TABLE pedidos ADD CONSTRAINT ck_valor_minimo CHECK (valor_total > 0.10);

-- 7. Desativar e Ativar uma Constraint (Útil para cargas massivas)
ALTER TABLE pedidos DISABLE CONSTRAINT fk_cliente;
ALTER TABLE pedidos ENABLE CONSTRAINT fk_cliente;
