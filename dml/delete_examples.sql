-- ==========================================================
-- EXEMPLOS DE DML: DELETE (REMOÇÃO DE DADOS)
-- ==========================================================

/* ESTRUTURA PARA TESTE:
  CREATE TABLE clientes_teste (
      id_cliente   NUMBER PRIMARY KEY,
      nome         VARCHAR2(100),
      status       VARCHAR2(20)
  );
*/

-- 1. Delete Simples (Removendo um registro específico)
-- SEMPRE utilize o WHERE para evitar apagar todos os dados
DELETE FROM clientes_teste
WHERE id_cliente = 1;

-- 2. Delete com Múltiplas Condições
DELETE FROM clientes_teste
WHERE status = 'INATIVO'
  AND id_cliente < 100;

-- 3. Delete usando Subquery (IN)
-- Apaga clientes que não possuem pedidos registrados em outra tabela
DELETE FROM clientes_teste
WHERE id_cliente NOT IN (SELECT id_cliente FROM pedidos);

-- 4. Delete de Todos os Registros
-- Diferente do TRUNCATE, o DELETE gera log de undo e permite ROLLBACK
DELETE FROM clientes_teste;

-- 5. Uso do ROLLBACK para cancelar a remoção (antes do COMMIT)
DELETE FROM clientes_teste WHERE id_cliente = 2;
ROLLBACK; -- O cliente com ID 2 será restaurado

-- 6. Confirmando a exclusão permanentemente
COMMIT;
