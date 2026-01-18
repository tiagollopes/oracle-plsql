-- Exemplo de constantes em PL/SQL
-- Constantes são declaradas usando a palavra-chave CONSTANT

DECLARE
    -- Constantes simples
    c_app_name CONSTANT VARCHAR2(20) := 'Oracle PL/SQL';
    c_version  CONSTANT NUMBER := 1;
    c_pi       CONSTANT NUMBER := 3.14159;
    c_active   CONSTANT BOOLEAN := TRUE;

    -- Constante baseada em outra constante
    c_max_users CONSTANT NUMBER := 100;

BEGIN
    DBMS_OUTPUT.PUT_LINE('App name: ' || c_app_name);
    DBMS_OUTPUT.PUT_LINE('Version: ' || c_version);
    DBMS_OUTPUT.PUT_LINE('PI: ' || c_pi);
    DBMS_OUTPUT.PUT_LINE('Active: ' || CASE WHEN c_active THEN 'TRUE' ELSE 'FALSE' END);
    DBMS_OUTPUT.PUT_LINE('Max users: ' || c_max_users);
END;
/
