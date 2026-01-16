-- Exemplo de variáveis em PL/SQL

DECLARE
    -- Tipos básicos
    v_name        VARCHAR2(50);
    v_age         NUMBER;
    v_salary      NUMBER(10,2);
    v_active      BOOLEAN;
    v_created_at  DATE;

BEGIN
    -- Atribuindo valores
    v_name       := 'Tiago';
    v_age        := 30;
    v_salary     := 4500.75;
    v_active     := TRUE;
    v_created_at := SYSDATE;

    -- Exibindo valores
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Active: ' || CASE WHEN v_active THEN 'TRUE' ELSE 'FALSE' END);
    DBMS_OUTPUT.PUT_LINE('Created at: ' || TO_CHAR(v_created_at, 'DD/MM/YYYY HH24:MI:SS'));
END;
/
