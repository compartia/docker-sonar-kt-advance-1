# KT Advance SonarQube Plugin Docker

## Contents
### [/ktadvance-h2-empty-sq](ktadvance-h2-empty-sq)
KT Advance plugin installed in SonarQube using H2 database

### [/demo-sonarqube-postgresql-ktadvance](demo-sonarqube-postgresql-ktadvance)
SonarQube configured to run with Postgres database;  KT-Advance plugin pre-installed.
(Supposed to run as a part of composite ([this](composite-postgresql-empty-sq) or  [this](composite-postgresql-populated-sq)) together with [postgresql-empty-sq](postgresql-empty-sq) or [postgresql-populated-sq](postgresql-populated-sq) )

### [/postgresql-empty-sq](postgresql-empty-sq)
A Posgress database with empty SQ tables. Bears only pre-created user accounts and default setting for things like Quality Profiles etc... To be used in composition with [/demo-sonarqube-postgresql-ktadvance](demo-sonarqube-postgresql-ktadvance)

### [/postgresql-populated-sq](postgresql-populated-sq)
Same like [/postgresql-empty-sq](postgresql-empty-sq), but also contains ‘dnsmasq’ sample analysis results. To be used in composition with [/demo-sonarqube-postgresql-ktadvance](demo-sonarqube-postgresql-ktadvance)


### Docker Images dependency diagram
![Docker Images dependency diagram](https://raw.githubusercontent.com/kestreltechnology/docker-sonar-kt-advance/master/docs/deps.png)


## SonarQube with H2 database
To run bare SonarQube with only KT-Advance plugin pre-installed, you need either to build the Docker image
```
$ docker build -t kestreltechnology/ktadvance-h2-empty-sq .
```
OR
to pull the image from Docker Hub

```
$ docker pull kestreltechnology/ktadvance-h2-empty-sq
```
Then run it with this command:
```
$ docker run -d --name my-sq-kt -p 9000:9000 -p 9092:9092 kestreltechnology/ktadvance-h2-empty-sq
```
#### Docker image
https://hub.docker.com/r/kestreltechnology/ktadvance-h2-empty-sq/
#### KT-Advance plugin for SonarQube
https://github.com/kestreltechnology/sonar-kt-advance/releases/download/5.6.0-b/sonar-kt-advance-plugin-5.6.0.jar

## SonarQube with Postgres database
To run SonarQube with Postgres pre-filled with Dnsmasq project analysis,
just run docker composite from the subdir [./composite-postgresql-populated-sq](composite-postgresql-populated-sq):
```
$ cd composite-postgresql-populated-sq
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
- https://hub.docker.com/r/kestreltechnology/demo-sonarqube-postgresql-ktadvance/
- https://hub.docker.com/r/kestreltechnology/postgresql-populated-sq/


## Running the SonarQube scanner
To run the scanner on your KT-analyzed C project run `sonar-scanner` in the project dir. (In case you don’t have `sonar-scanner CLI`, please get it from (http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner) ).
To log more debug info into console, you may run the scanner in verbose mode: `sonar-scanner -X`.
