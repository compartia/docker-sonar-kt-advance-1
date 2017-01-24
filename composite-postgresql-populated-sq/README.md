# SonarQube with Postgres database ‘dnsmasq’ sample analysis results

To run SonarQube with Postgres pre-filled with 'dnsmasq' project analysis,
just run docker composite:

```
$ cd composite-postgresql-populated-sq
$ docker-compose up
```

After everything is up, you may navigate to [http://localhost:9000](http://localhost:9000)

## SonarQube users
There are 2 accounts pre-created:

- Guest User:

  login: `guest` 
  password: `guest`
  
- Administrator User:

  login: `admin` 
  password: `admin`
