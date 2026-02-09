-- ==========================================================
-- EXEMPLOS DE DCL: GRANT (CONTROLE DE ACESSO)
-- ==========================================================

-- 1. Conceder privilégios de leitura em uma tabela para um usuário específico
GRANT SELECT ON clientes TO usuario_consulta;

-- 2. Conceder múltiplos privilégios em uma tabela
GRANT SELECT, INSERT, UPDATE ON pedidos TO usuario_operador;

-- 3. Conceder privilégio de execução em uma Procedure ou Function
GRANT EXECUTE ON prc_calcula_total TO usuario_app;

-- 4. Conceder privilégios com opção de repasse (GRANT OPTION)
-- Permite que o usuário destino também conceda esse privilégio a outros
GRANT SELECT ON logs_sistema TO usuario_admin WITH GRANT OPTION;

-- 5. Conceder privilégios em todos os objetos de um tipo (via Role)
-- Primeiro cria-se a role, depois concede privilégios a ela
CREATE ROLE role_relatorios;
GRANT SELECT ON clientes TO role_relatorios;
GRANT SELECT ON pedidos TO role_relatorios;

-- Atribuindo a role a um usuário
GRANT role_relatorios TO usuario_analista;

-- 6. Conceder privilégios de sistema (Exemplos comuns para novos usuários)
GRANT CREATE SESSION TO novo_usuario;
GRANT CREATE TABLE, CREATE VIEW TO desenvolvedor;
GRANT UNLIMITED TABLESPACE TO desenvolvedor;
