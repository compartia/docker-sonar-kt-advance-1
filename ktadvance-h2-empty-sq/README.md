### KT Advance plugin installed in SonarQube using H2 database


#### Docker hub  

https://hub.docker.com/r/kestreltechnology/ktadvance-h2-empty-sq/tags/

#### Installation
```
docker pull kestreltechnology/ktadvance-h2-empty-sq
```

#### Usage
- to run SonarQube:
```
docker run -d --name ktadvance-h2-empty-sq -p 9000:9000 -p 9092:9092 kestreltechnology/ktadvance-h2-empty-sq
```

- to configure SonarQube:
Log in to SonarQube:
password: `admin`
username: `admin`
