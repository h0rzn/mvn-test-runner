FROM eclipse-temurin:21-jdk-alpine

VOLUME /opt/project_source

RUN apk add --no-cache maven

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /opt/project_source

ENTRYPOINT ["entrypoint.sh"]
