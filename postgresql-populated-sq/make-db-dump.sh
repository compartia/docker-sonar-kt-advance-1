pg_dump --host localhost --port 5433 --username "sonar" --no-password  --format custom --blobs --verbose --file "./docker-entrypoint-initdb.d/sonar-db.backup" "sonar"
