# Imagem base oficial do Oracle XE
FROM container-registry.oracle.com/database/express:21.3.0-xe

# Definir um usuário não-root (requisito da entrega)
# OBS: essa imagem vem com o user 'oracle' já não-root
USER oracle

# Definir um diretório de trabalho (requisito da entrega)
WORKDIR /home/oracle

# Variáveis de ambiente (requisito)
ENV ORACLE_PWD=367Thesco
ENV ORACLE_CHARACTERSET=AL32UTF8

# Expor as portas (requisito)
EXPOSE 1521 
EXPOSE 5500

# Volume nomeado (pra persistência dos dados)
# ATENÇÃO: isso é uma instrução declarativa, o volume precisa ser criado na hora do `docker run`
VOLUME ["/opt/oracle/oradata"]
