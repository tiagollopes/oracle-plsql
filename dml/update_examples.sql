-- ==========================================================
-- EXEMPLOS DE DML: UPDATE (ATUALIZAÇÃO DE DADOS)
-- ==========================================================

/* ESTRUTURA PARA TESTE (Caso não tenha criado no exemplo de INSERT):
  CREATE TABLE clientes_teste (
      id_cliente   NUMBER PRIMARY KEY,
      nome         VARCHAR2(100),
      email        VARCHAR2(100),
      status       VARCHAR2(20) DEFAULT 'ATIVO',
      data_criacao DATE DEFAULT SYSDATE
  );
*/

-- 1. Update Simples (Filtrando por ID)
UPDATE clientes_teste
SET email = 'novo_email@exemplo.com'
WHERE id_cliente = 1;

-- 2. Update de Múltiplas Colunas
UPDATE clientes_teste
SET nome = 'João da Silva Sauro',
    status = 'PREMIUM'
WHERE id_cliente = 1;

-- 3. Update com Subquery (Atualizar com base em outra tabela)
-- Exemplo: Atualizar o status do cliente com base em uma tabela de auditoria
UPDATE clientes_teste c
SET c.status = (SELECT status_novo FROM auditoria_status a WHERE a.id_cliente = c.id_cliente)
WHERE EXISTS (SELECT 1 FROM auditoria_status a WHERE a.id_cliente = c.id_cliente);

-- 4. Update em Massa (Sem WHERE - CUIDADO!)
-- Geralmente usado para resetar colunas ou flags em toda a tabela
UPDATE clientes_teste
SET status = 'INATIVO';

-- 5. Utilizando Funções no Update
UPDATE clientes_teste
SET nome = UPPER(nome),
    email = LOWER(email);

-- Importante: O UPDATE inicia uma transação que precisa de confirmação
COMMIT;

-- Caso tenha errado o WHERE e queira voltar antes do COMMIT:
-- ROLLBACK;
