FROM sonarqube:5.6.4-alpine

MAINTAINER Artem Zaborskiy “artem@toptal.com"

RUN apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/community wget ca-certificates

ENV PLUGINS_DIR /opt/sonarqube/extensions/plugins

WORKDIR $PLUGINS_DIR
RUN curl -s https://api.github.com/repos/kestreltechnology/sonar-kt-advance/releases/latest|grep browser_download_url | cut -d '"' -f 4 | wget -qi -

RUN ls -la $PLUGINS_DIR
WORKDIR $SONARQUBE_HOME
