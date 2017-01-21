### A PostgreSQL database initialized with empty SonarQube tables.

A Posgress database with empty SQ tables.

Bears only pre-created user accounts and default setting for things like Quality Profiles etc.

To be used in [composition](../composite-postgresql-populated-sq) together with [demo-sonarqube-postgresql-ktadvance](../demo-sonarqube-postgresql-ktadvance)


To run Postgres on port 5433, use this command:
```
docker run --name postgresql-empty-sq -p 5433:5432 -e POSTGRES_PASSWORD=sonar -e POSTGRES_USER=sonar kestreltechnology/postgresql-empty-sq
```
