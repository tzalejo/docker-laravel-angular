#!/bin/bash
#
# Copy createdb.sh.example to createdb.sh
# then uncomment then set database name and username to create you need databases
#
# example: .env POSTGRES_USER=appuser and need db name is myshop_db
# 
#    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
#        CREATE USER myuser WITH PASSWORD 'mypassword';
#        CREATE DATABASE myshop_db;
#        GRANT ALL PRIVILEGES ON DATABASE myshop_db TO myuser;
#    EOSQL
#
# this sh script will auto run when the postgres container starts and the $DATA_PATH_HOST/postgres not found.
#
# 
# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
#     CREATE USER db1 WITH PASSWORD 'db1';
#     CREATE DATABASE db1;
#     GRANT ALL PRIVILEGES ON DATABASE db1 TO db1;
# EOSQL
# 
# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
#     CREATE USER db2 WITH PASSWORD 'db2';
#     CREATE DATABASE db2;
#     GRANT ALL PRIVILEGES ON DATABASE db2 TO db2;
# EOSQL
### default database and user for confluence ##############################################
# if [ "$CONFLUENCE_POSTGRES_INIT" == 'true' ]; then
# 	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
# 		CREATE USER $POSTGRES_CONFLUENCE_USER WITH PASSWORD '$POSTGRES_CONFLUENCE_PASSWORD';
# 		CREATE DATABASE $POSTGRES_CONFLUENCE_DB;
# 		GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_CONFLUENCE_DB TO $POSTGRES_CONFLUENCE_USER;
# 		ALTER ROLE $POSTGRES_CONFLUENCE_USER CREATEROLE SUPERUSER;
# 	EOSQL
# 	echo
# fi


### Base de Datos ##############################################
# 
# psql -v ON_ERROR_STOP=1 --username "admin" --dbname "cec" <<-EOSQL
#     CREATE USER admin WITH PASSWORD 'admin';
#     CREATE DATABASE cec;
#     GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO admin;
# EOSQL
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';
    CREATE DATABASE $POSTGRES_DB;
    GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $POSTGRES_USER;
EOSQL
