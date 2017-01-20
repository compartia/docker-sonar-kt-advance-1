# KT Advance SonarQube Plugin Docker

## Contents
### [/SQ-KT](SQ-KT)
Bare SonarQube on H2 DB with KT-Advance plugin pre-installed

### [/SQ-KT-PG](SQ-KT-PG)
SonarQube configured to run with Postgres database;  KT-Advance plugin pre-installed.
(Supposed to run as a part of composite together with [PG](PG) or [PG-dnsmasq](PG-dnsmasq) )

### [/PG](PG)
A Posgress database with empty SQ tables. Bears only pre-created user accounts and default setting for things like Quality Profiles etc... To be used in composition with [SQ-KT-PG](SQ-KT-PG)

### [/PG-dnsmasq](PG-dnsmasq)
Same like PG, but also contains ‘dnsmasq’ sample analysis results. To be used in composition with [SQ-KT-PG](SQ-KT-PG)


### Docker Images dependency diagram
![Docker Images dependency diagram](https://github.com/compartia/docker-sonar-kt-advance/blob/master/docs/deps.png?raw=true)


## SonarQube with H2 database
To run bare SonarQube with only KT-Advance plugin pre-installed, you need either to build the Docker image
```
$ docker build -t kestreltechnology/sq-kt:5.6.0 .
```
OR
to pull the image from Docker Hub

```
$ docker pull kestreltechnology/sq-kt:5.6.0
```
Then run it with this command:
```
$ docker run -d --name my-sq-kt -p 9000:9000 -p 9092:9092 kestreltechnology/sq-kt:5.6.0
```
#### Docker image
https://hub.docker.com/r/kestreltechnology/sq-kt/
#### KT-Advance plugin for SonarQube
https://github.com/kestreltechnology/sonar-kt-advance/releases/download/5.6.0-b/sonar-kt-advance-plugin-5.6.0.jar

## SonarQube with Postgres database
To run SonarQube with Postgres pre-filled with Dnsmasq project analysis,
just run docker composite from the subdir [SQ-KT-PG-dnsmasq](SQ-KT-PG-dnsmasq):
```
$ docker-compose up
```

After seeing in the console something like
```
sonarqube_1  | INFO  ce[o.s.ce.app.CeServer] Compute Engine is up
sonarqube_1  | INFO  app[o.s.p.m.Monitor] Process[ce] is up
```
you may navigate to [http://localhost:9000](http://localhost:9000)

#### Docker images
the Docker composite is built of 2 containers. One for SonarQube, other for Posgres DB. The corresponding images are:
- https://hub.docker.com/r/kestreltechnology/pg-dnsmasq/
- https://hub.docker.com/r/kestreltechnology/sq-kt-pg/

## Known issues
- there's a small chance that Posgres DB is not yet started at the moment when SonarQube needs it. In this case just re-start the composite. *Most likely it is fixed, unable to reproduce after employing docker/wait-for-it.sh script*

## Running the SonarQube scanner
To run the scanner on your KT-analyzed C project run `sonar-scanner` in the project dir. (In case you don’t have `sonar-scanner CLI`, please get it from (http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner) ).
To log more debug info into console, you may run the scanner in verbose mode: `sonar-scanner -X`.
