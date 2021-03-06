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
To run SonarQube with Postgres pre-filled with demo projects analysis, you basically need to 
1. download only 1 file:
  - [/composite-postgresql-populated-sq/docker-compose.yml](./composite-postgresql-populated-sq/docker-compose.yml)
2. in termial window, run 
```
export NS=kestreltechnology
#use recent version number (or 'latest')
export TAG=5.6.7
docker-compose up
```
- optionally you may refer [/run-demo.sh](./run-demo.sh) file
- the recent version number corresponds to the plug-in version (https://github.com/kestreltechnology/sonar-kt-advance/releases)

3. Wait for messages like 
```
sonarqube_1  | INFO  ce[o.s.ce.app.CeServer] Compute Engine is up
sonarqube_1  | INFO  app[o.s.p.m.Monitor] Process[ce] is up
```
4. navigate to [http://localhost:9000](http://localhost:9000)  


#### Docker images dependencies
The Docker composite is built of 2 containers. One for SonarQube, other for Posgres DB. The corresponding images are (please refer Docker Images Dependency Diagram above):
- https://hub.docker.com/r/kestreltechnology/demo-sonarqube-postgresql-ktadvance/
- https://hub.docker.com/r/kestreltechnology/postgresql-populated-sq/


## Running the SonarQube scanner
Before the first scanner run, put `sonar-project.properties` file into the root dir of you C project. A sample .properties file could be found here: [here](https://github.com/kestreltechnology/sonar-kt-advance/blob/master/src/test/resources/test_project/redis/sonar-project.properties)

To run the scanner on your KT-analyzed C project run `sonar-scanner` in the project dir. (In case you don’t have `sonar-scanner CLI`, please get it from (http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner) ).
To log more debug info into console, you may run the scanner in verbose mode: `sonar-scanner -X`.

# Contributing
## Building with Docker Cloud

Docker Cloud ( https://cloud.docker.com/app/kestreltechnology/repository/list )
is configured to build this repo automatically.

### Building `latest` version
- Every push to `master`branch  will result in re-building Docker images and re-publishing them on Docker Hub ( https://hub.docker.com/u/kestreltechnology/ ) with tag `latest`. 
The `latest` (https://github.com/kestreltechnology/sonar-kt-advance/releases/latest) sonar-kt-advance plug-in version is used for building `master` branch.

### Releasing a stable version
- Adding a version-alike tag ( example : `1.2.3-alpha` ) on any branch will trigger Docker Cloud build with consequent publishing to Docker Hub. The published images will be tagged in accordance with the repo tag (pattern: kestreltechnology/image-base-name:`1.2.3-alpha` ).  
**prerequisite:**
A released sonar-kt-advance plug-in jar version (`1.2.3-alpha` in this example)
must be available at (https://github.com/kestreltechnology/sonar-kt-advance/releases/) at build time. 




### Building Docker images manually
- Call `build.sh latest <namespace>` to get latest sonar-kt-advance release version number from GitHub  
- Call `build.sh none <namespace>` to build Docker images with no tag  
- Call `build.sh <Docker tag version> <namespace> push` to build Docker images and to push them into Docker hub  

example:  
```build.sh 5.3.0 kestreltechnology```

example:  
```build.sh latest kestreltechnology push```
