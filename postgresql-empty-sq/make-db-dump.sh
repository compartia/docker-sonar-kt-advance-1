pg_dump -Z9 --host localhost --port 5433 --username "sonar" --role "sonar" --no-password  --format custom  --oids  --verbose --file "./docker-entrypoint-initdb.d/sonar-db-empty.backup" "sonar"
