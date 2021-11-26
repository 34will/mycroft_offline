#!/bin/sh
# postgres-user.sh

set -e

host="$1"
port="$2"
password=$3

PGPASSWORD=$POSTGRES_PASSWORD psql -h "$host" -p "$port" -U "postgres" -c "DO
\$do\$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'selene') THEN
        CREATE ROLE selene WITH LOGIN CONNECTION LIMIT -1 PASSWORD '$password';
    END IF;
END
\$do\$;"
