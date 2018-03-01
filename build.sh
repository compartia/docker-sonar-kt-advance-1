echo "-------------------------------"
echo "BUILD ARGS:" $1 $2

if [ -z "$1" ]; then
    echo "\n\n"
    echo "Please call '$0 <Docker tag version>' to run this command."
    echo "Call '$0 latest' to get latest sonar-kt-advance release version number from GitHub"
    echo "Call '$0 none' to build Docker images with no tag"
    echo "Call '$0 <Docker tag version> push' to build Docker images and to push them into Docker hub"
    exit 1
fi

if [ "$1" ]; then
    VER=:$1
    if [ "$1" = "latest" ]; then
        echo "fetching latest release version number from GitHub ..."
        VER=:$(curl -s https://api.github.com/repos/kestreltechnology/sonar-kt-advance/releases/latest | grep tag_name | cut -d '"' -f 4)        
    fi

    if [ "$1" = "none" ]; then
        VER=""
    fi
    
fi

echo building version $VER

NS=kestreltechnology

#docker build -t $NS/postgresql-empty-sq$VER ./postgresql-empty-sq

docker build -t $NS/ktadvance-h2-empty-sq$VER ./ktadvance-h2-empty-sq

#docker build -t $NS/demo-sonarqube-postgresql-ktadvance$VER ./demo-sonarqube-postgresql-ktadvance

#docker build -t $NS/postgresql-populated-sq$VER ./postgresql-populated-sq


if [ "$2" = "push" ]; then
    echo pushing version $VER
    #docker push $NS/postgresql-empty-sq$VER
    docker push $NS/ktadvance-h2-empty-sq$VER
    #docker push $NS/demo-sonarqube-postgresql-ktadvance$VER
    #docker push $NS/postgresql-populated-sq$VER
fi
