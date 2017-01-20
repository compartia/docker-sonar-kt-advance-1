### Postgres DB pre-filled with sample KT-Advance analysis


To run Postgres on port 5433, use this command:
```
artems-MacBook-Pro:PG-dnsmasq artem$ docker run --name sq-postgres-dnsmasq -p 5433:5432 -e POSTGRES_PASSWORD=sonar -e POSTGRES_USER=sonar kestreltechnology/pg-dnsmasq:5.6.0
```
