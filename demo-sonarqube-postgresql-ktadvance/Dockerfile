ARG SOURCE_BRANCH
FROM kestreltechnology/ktadvance-h2-empty-sq
MAINTAINER Artem Zaborskiy “artem@toptal.com"

ENV FROM_VERSION=${SOURCE_BRANCH}
RUN echo "FROM_VERSION=$FROM_VERSION"

#install PG command line tools
RUN apk --update add postgresql-client

COPY wait-for-it.sh $SONARQUBE_HOME/bin
RUN chmod +x $SONARQUBE_HOME/bin/wait-for-it.sh

#WORKDIR $PLUGINS_DIR
#RUN pwd
#RUN ls -l
WORKDIR $SONARQUBE_HOME

CMD ["./bin/wait-for-it.sh", "db", "./bin/run.sh", ""]
