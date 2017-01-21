### Postgres DB pre-filled with sample KT-Advance analysis


To run Postgres on port 5433, use this command:
```
docker run --name postgresql-populated-sq -p 5433:5432 -e POSTGRES_PASSWORD=sonar -e POSTGRES_USER=sonar kestreltechnology/postgresql-populated-sq
```
