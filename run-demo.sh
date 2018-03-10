VER=$(curl -s https://api.github.com/repos/kestreltechnology/sonar-kt-advance/releases/latest | grep tag_name | cut -d '"' -f 4) 
alias errcho='>&2 echo'
if [ -z "$VER" ]; then    
    errcho "ERROR: cannot get version number from GitHub, please check https://api.github.com/repos/kestreltechnology/sonar-kt-advance/releases/latest"
    exit -1
fi

export NS=kestreltechnology
export TAG=$VER

cd ./composite-postgresql-populated-sq
docker-compose config
docker-compose up
