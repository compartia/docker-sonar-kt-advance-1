### Postgres DB pre-filled with sample KT-Advance analysis

#### running Postgres:
To run Postgres on port 5433, use this command:
```
docker run --name postgresql-populated-sq -p 5433:5432 -e POSTGRES_PASSWORD=sonar -e POSTGRES_USER=sonar kestreltechnology/postgresql-populated-sq
```

#### Making DB dump:
```
pg_dump --host localhost --port 5433 --username "sonar" --no-password  --format custom --blobs --verbose --file "docker-entrypoint-initdb.d/sonar-db.backup" "sonar"``` 

