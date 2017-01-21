NS=kestreltechnology
VER=5.6.0

docker push $NS/postgresql-empty-sq:$VER

docker push $NS/ktadvance-h2-empty-sq:$VER

docker push $NS/demo-sonarqube-postgresql-ktadvance:$VER

docker push $NS/postgresql-populated-sq:$VER
