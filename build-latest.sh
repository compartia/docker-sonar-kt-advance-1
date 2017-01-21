 NS=kestreltechnology

docker build -t $NS/postgresql-empty-sq ./postgresql-empty-sq

docker build -t $NS/ktadvance-h2-empty-sq ./ktadvance-h2-empty-sq

docker build -t $NS/demo-sonarqube-postgresql-ktadvance ./demo-sonarqube-postgresql-ktadvance

docker build -t $NS/postgresql-populated-sq ./postgresql-populated-sq
