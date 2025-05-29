# $DEVOPS-TOOLS-CLOUD-COMPUTING$

## Adicionar os usuários ao bando de dados

### Passo 1

```sql
-- Estando como SYS (com SYSDBA):
ALTER SESSION SET CONTAINER = XEPDB1;

-- Criação dos usuários
CREATE USER gustavo IDENTIFIED BY rm555708;
GRANT CONNECT TO gustavo;

CREATE USER nathalia IDENTIFIED BY rm554945;
GRANT CONNECT TO nathalia;

CREATE USER francesco IDENTIFIED BY rm557313;
GRANT CONNECT TO francesco;

CREATE USER fontevivauser IDENTIFIED BY fontevivapass;
GRANT CONNECT TO fontevivauser;

-- (Opcional) Permitir que criem objetos (views, procedures etc.)
GRANT RESOURCE TO gustavo;
GRANT RESOURCE TO nathalia;
GRANT RESOURCE TO francesco;

ALTER USER francesco QUOTA UNLIMITED ON users;
ALTER USER gustavo QUOTA UNLIMITED ON users;
ALTER USER nathalia QUOTA UNLIMITED ON users;
ALTER USER fontevivauser QUOTA UNLIMITED ON users;

```

### Passo 2

dentro do meu usuário

```sql
  BEGIN
    FOR r IN (
      SELECT table_name FROM user_tables
    ) LOOP
      EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON ' || r.table_name || ' TO gustavo';
      EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON ' || r.table_name || ' TO nathalia';
      EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON ' || r.table_name || ' TO fontevivauser';
    END LOOP;
  END;
  /

```
