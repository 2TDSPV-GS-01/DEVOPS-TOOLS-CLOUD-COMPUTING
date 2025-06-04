# Imagem base oficial do Oracle XE
FROM container-registry.oracle.com/database/express:21.3.0-xe

# Definir um usuário não-root
USER oracle

# Definir um diretório de trabalho 
WORKDIR /home/oracle

# Variáveis de ambiente 
ENV ORACLE_PWD=367Thesco
ENV ORACLE_CHARACTERSET=AL32UTF8

# Expor as portas 
EXPOSE 1521 
EXPOSE 5500

# Volume nomeado (pra persistência dos dados)
VOLUME ["/opt/oracle/oradata"]
