### Bare SonarQube on H2 DB with KT-Advance plugin pre-installed

#### Docker hub  

https://hub.docker.com/r/kestreltechnology/kt-advance-sq/tags/

#### Installation
```
docker pull kestreltechnology/kt-advance-sq:5.5.7
```

#### Usage
- to run SonarQube:
```
docker run -d --name kt-advance-sq -p 9000:9000 -p 9092:9092 kestreltechnology/kt-advance-sq:5.5.7
```

- to configure SonarQube:
Log in to SonarQube:
password: `admin`
username: `admin`
