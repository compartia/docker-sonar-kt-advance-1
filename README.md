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
Similar to [/postgresql-empty-sq](postgresql-empty-sq), but also contains ‘dnsmasq’ sample analysis results. To be used in composition with [/demo-sonarqube-postgresql-ktadvance](demo-sonarqube-postgresql-ktadvance)


### Docker Images dependency diagram
![Docker Images dependency diagram](https://raw.githubusercontent.com/kestreltechnology/docker-sonar-kt-advance/master/docs/deps.png)


## SonarQube with H2 database
To run bare SonarQube with only KT-Advance plugin pre-installed, you need either to build the Docker image
```
$ docker build -t kestreltechnology/ktadvance-h2-empty-sq ./ktadvance-h2-empty-sq
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
https://github.com/kestreltechnology/sonar-kt-advance/releases/download/latest

## SonarQube with Postgres database
To run SonarQube with Postgres pre-filled with demo projects analysis,
just call
```
$ sh run-demo.sh
```

Please edit `export TAG=latest` line in `run-demo.sh` to set the desired version number.

After seeing in the console something like
```
sonarqube_1  | INFO  ce[o.s.ce.app.CeServer] Compute Engine is up
sonarqube_1  | INFO  app[o.s.p.m.Monitor] Process[ce] is up
```
you may navigate to [http://localhost:9000](http://localhost:9000)

#### Docker images dependencies
The Docker composite is built of 2 containers. One for SonarQube, other for Posgres DB. The corresponding images are (please refer Docker Images Dependency Diagram above):
- https://hub.docker.com/r/kestreltechnology/demo-sonarqube-postgresql-ktadvance/
- https://hub.docker.com/r/kestreltechnology/postgresql-populated-sq/


## Running the SonarQube scanner
Before the first scanner run, put `sonar-project.properties` file into the root dir of you C project. A sample .properties file could be found here: [here](https://github.com/kestreltechnology/sonar-kt-advance/blob/master/src/test/resources/test_project/redis/sonar-project.properties)

To run the scanner on your KT-analyzed C project run `sonar-scanner` in the project dir. (In case you don’t have `sonar-scanner CLI`, please get it from (http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner) ).
To log more debug info into console, you may run the scanner in verbose mode: `sonar-scanner -X`.

## Contributing
### Building docker images
Call `build.sh latest <namespace>` to get latest sonar-kt-advance release version number from GitHub
Call `build.sh none <namespace>` to build Docker images with no tag
Call `build.sh <Docker tag version> <namespace> push` to build Docker images and to push them into Docker hub

example:  
```build.sh 5.3.0 kt push```

example:  
```build.sh latest kt push```
