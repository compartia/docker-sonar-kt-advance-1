pg_dump -Z9 --host localhost --port 5433 --username "sonar" --role "sonar" --no-password  --format custom --blobs --encoding UTF8 --oids --no-tablespaces --verbose --file "./docker-entrypoint-initdb.d/sonar-db.backup" "sonar"

