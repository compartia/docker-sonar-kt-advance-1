VER=5.6.0
NS=kestreltechnology

docker build -t $NS/pg:$VER ./PG

docker build -t $NS/sq-kt:$VER ./SQ-KT

docker build -t $NS/sq-kt-pg:$VER ./SQ-KT-PG

docker build -t $NS/pg-dnsmasq:$VER ./PG-dnsmasq
