echo "*** restoring sonar db ***"
set -e
pg_restore --single-transaction -d sonar -U sonar --verbose "docker-entrypoint-initdb.d/sonar-db.backup"
