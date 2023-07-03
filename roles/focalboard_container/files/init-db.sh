#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE DATABASE boards;
	CREATE USER boards WITH PASSWORD 'focalboards';
	GRANT ALL PRIVILEGES ON DATABASE boards TO boards;
EOSQL
