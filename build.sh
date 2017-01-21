VER=5.6.0
NS=kestreltechnology

docker build -t $NS/postgresql-empty-sq:$VER ./postgresql-empty-sq

docker build -t $NS/ktadvance-h2-empty-sq:$VER ./ktadvance-h2-empty-sq

docker build -t $NS/demo-sonarqube-postgresql-ktadvance:$VER ./demo-sonarqube-postgresql-ktadvance

docker build -t $NS/postgresql-populated-sq:$VER ./postgresql-populated-sq
